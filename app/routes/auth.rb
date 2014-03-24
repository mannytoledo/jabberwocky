require_relative './base'

module Jabberwocky
  module Routes
    class Auth < Base
      get '/auth/:provider/callback' do
        self.current_user = User.from_auth!(env['omniauth.auth'])
        redirect '/'
      end
    end
  end
end
