require_relative './base'

module Jabberwocky
  module Routes
    class Assets < Base
      get '/assets/*' do
        env['PATH_INFO'].sub!(%r{^/assets}, '')
        settings.assets.call(env)
      end
    end
  end
end
