require 'rubygems'
require 'bundler'
Bundler.require

# 3rd Party Stuff
require 'sinatra/base'
require 'sinatra/sequel'
require 'active_support/core_ext/string'
require 'active_support/core_ext/array'
require 'active_support/core_ext/hash'
require 'active_support/json'
require 'better_errors'

# library modules
libraries = Dir[File.expand_path('../lib/**/*.rb', __FILE__)]
libraries.each do |path_name|
  require path_name
end

# App module wrappers
require_relative './app/routes'

module Jabberwocky
  class App < Sinatra::Application
    configure do
      set :database, lambda {
        ENV['DATABASE_URL'] || "postgres://localhost:5432/jabberwocky_#{environment}"
      }
    end

    configure :development do
      database.loggers << Logger.new(STDOUT)

      use BetterErrors::Middleware
      BetterErrors.application_root = __dir__
    end

    configure do
      disable :method_override
      disable :static

      set :erb, escape_html: true
      set :protection, except: :session_hijacking
      set :sessions,
          httponly: true,
          secure: false,
          expire_after: 5.years,
          secret: ENV['SESSION_SECRET']
    end

    use Rack::Deflater

    use Jabberwocky::Routes::Auth
    use Jabberwocky::Routes::Assets
    use Jabberwocky::Routes::Static
    use Jabberwocky::Routes::Index
    use Jabberwocky::Routes::Users
  end
end

require_relative './app/models'
include Jabberwocky::Models
