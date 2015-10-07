class AddCategoriesToCategory < ActiveRecord::Migration
  def change
    add_reference :categories, :supercategory, index: true
  end
end
