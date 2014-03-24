module Jabberwocky
  module Extensions
    module Auth
      module Helpers
        def current_user_from_session
          user_id = session[:user_id]
          user_id && User[user_id]
        end

        def current_user=(user)
          session[:user_id] = user && user.id
        end

        def current_user
          @current_user ||= current_user_from_session
        end

        def current_user?
          !!current_user
        end
      end

      class << self
        def registered(app)
          app.set :github_key, ENV['GITHUB_KEY']
          app.set :github_secret, ENV['GITHUB_SECRET']

          app.use OmniAuth::Builder do
            provider :github, app.github_key, app.github_secret
          end

          app.helpers Helpers
        end
      end
    end
  end
end
