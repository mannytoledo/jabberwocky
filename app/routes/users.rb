require_relative './base'

module Jabberwocky
  module Routes
    class Users < Base
      get '/logout' do
        session.destroy
        redirect '/'
      end
    end
  end
end
