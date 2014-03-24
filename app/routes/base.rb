require_relative '../helpers'
require_relative '../extensions'

module Jabberwocky
  module Routes
    class Base < Sinatra::Application
      configure do
        set :views, 'app/views'
        set :root, File.expand_path('../../../', __FILE__)

        set :inline_templates, true
        set :erb,
            layout: :default,
            layout_options: { views: 'app/views/layouts' }

        enable :use_code

        disable :method_override
        disable :protection
        disable :static
      end

      register Jabberwocky::Extensions::Assets
      register Jabberwocky::Extensions::Auth

      helpers Jabberwocky::Helpers
    end
  end
end
