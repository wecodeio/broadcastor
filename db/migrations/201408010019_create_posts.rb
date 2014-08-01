Sequel.migration do
  up do
    create_table :posts do
      String :body, text: true, null: false
      DateTime :created_at, null: false
      
      primary_key :id, type: Integer
    end
    
    run "alter table posts alter column created_at set default current_timestamp"
  end

  down do
    drop_table :posts
  end
end
