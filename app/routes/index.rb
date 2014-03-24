require_relative './base'

module Jabberwocky
  module Routes
    class Index < Base
      get '/' do
        @posts = Post.all
        erb :index
      end
    end
  end
end
