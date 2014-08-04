Sequel.migration do
  up do
    create_table :channels do
      String :slug, null: false
      String :name, null: false
      
      primary_key :id, type: Integer
    end
    alter_table(:posts){add_foreign_key :channel_id, :channels}

  end

  down do
    drop_column :posts, :channel_id
    drop_table :channels
  end
end
