class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      #t.string :email
      t.string :cep
      t.string :username
      #t.string :password
      t.string :address
      t.string :cpf
      t.integer :housenumber

      t.timestamps null: false
    end
  end
end
