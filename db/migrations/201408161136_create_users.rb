Sequel.migration do
  up do
    create_table :users do
      String :username, null: false
      String :password_hash, null: false
      
      primary_key :id, type: Integer
    end

  end

  down do
    drop_table :users
  end
end
