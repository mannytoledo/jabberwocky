Sequel.default_timezone = :utc

Sequel.extension :core_extensions
Sequel.extension :pg_array
Sequel.extension :pg_array_ops

Sequel::Model.plugin :timestamps
Sequel::Model.plugin :serialization

Sequel::Plugins::Serialization.register_format(
  :json,
  ->(v) { v.to_json },
  ->(v) { JSON.parse(v, symbolize_names: true) }
)

module Jabberwocky
  module Models; end
end

require_relative './models/user'
require_relative './models/post'
