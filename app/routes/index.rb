require_relative './base'

module Jabberwocky
  module Routes
    class Index < Base
      get '/' do
        erb :index
      end
    end
  end
end
