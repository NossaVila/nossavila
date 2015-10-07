class CreateCategoriesServices < ActiveRecord::Migration
  def self.up
    create_table :categories_services, :id => false do |t|
        t.references :category
        t.references :service
    end
    add_index :categories_services, [:category_id, :service_id]
    add_index :categories_services, :service_id
  end

  def self.down
    drop_table :categories_services
  end
end
