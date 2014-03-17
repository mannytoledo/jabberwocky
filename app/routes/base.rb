module Jabberwocky
  module Routes
    class Base < Sinatra::Application
      configure do
        set :views, 'app/views'
        set :root, File.expand_path('../../../', __FILE__)
        set :erb,
            layout: :default,
            layout_options: { views: 'app/views/layouts' }

        enable :use_code

        disable :method_override
        disable :protection
        disable :static
      end

      register Extensions::Assets

      helpers Jabberwocky::Helpers
      helpers Sinatra::ContentFor
    end
  end
end
