class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.string :email
      t.string :cnpj
      t.string :cep
      t.string :phone_number
      t.string :area_code
      t.string :site
      t.date :created_at
      t.date :updated_at
      t.timestamps null: false
    end
  end
end