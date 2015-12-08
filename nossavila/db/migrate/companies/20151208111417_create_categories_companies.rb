class CreateCategoriesCompanies < ActiveRecord::Migration
  def self.up
    create_table :categories_companies, :id => false do |t|
        t.references :category
        t.references :company
    end
    add_index :categories_companies, [:category_id, :company_id]
    add_index :categories_companies, :company_id
  end

  def self.down
    drop_table :categories_companies
  end
end
