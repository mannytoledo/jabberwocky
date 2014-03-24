Sequel.migration do
  change do
    create_table(:users) do
      column :id, :serial, null: false
      column :uid, 'text'
      column :username, 'text'
      column :about, 'text'
      column :email, 'text'
      column :url, 'text'
      column :name, 'text'
      column :auth, 'json'
      column :created_at, 'timestamp without time zone'
      column :updated_at, 'timestamp without time zone'
      column :admin, 'boolean', default: false

      primary_key [:id]

      index [:username]
      index [:id], unique: true
      index [:uid], unique: true
    end
  end
end
