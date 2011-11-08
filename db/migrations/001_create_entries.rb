Sequel.migration do
  change do
    create_table :entries do
      primary_key :id
      DateTime :create_date
      DateTime :modify_date
    end
  end
end
