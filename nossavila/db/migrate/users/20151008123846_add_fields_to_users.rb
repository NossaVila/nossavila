class AddFieldsToUsers < ActiveRecord::Migration
  def change
      add_column :users, :first_name, :string
      add_column :users, :last_name, :string
      add_column :users, :cep, :string
      add_column :users, :username, :string
      add_column :users, :address, :string
      add_column :users, :cpf, :string
  end
end
