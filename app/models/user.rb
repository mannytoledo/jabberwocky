module Jabberwocky
  module Models
    class User < Sequel::Model
      dataset_module do
        def find_by_uid(uid)
          first(uid: uid)
        end
      end

      class << self
        def from_auth!(auth)
          auth = auth.with_indifferent_access

          user = find_by_uid(auth[:uid]) || new
          user.uid = auth[:uid]
          user.auth = auth.except(:extra)
          user.name ||= auth[:info][:name]
          user.email ||= auth[:info][:email]
          user.username ||= auth[:info][:nickname]
          user.about ||= auth[:info][:description]
          user.url ||= auth[:info][:urls][:Blog]

          user.save
          user
        end
      end

      serialize_attributes :json, :auth
    end
  end
end
