Sequel.migration do
  change do
    create_table(:posts) do
      column :id, :serial, null: false
      column :title, 'text'
      column :body, 'text'
      column :create_at, 'timestamp without time zone', null: false
      column :modified_at, 'timestamp without time zone', null: false

      primary_key [:id]
    end
  end
end
