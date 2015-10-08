class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :title
      t.text :description
      t.date :created_at
      t.date :updated_at
      t.timestamps null: false
    end
  end

end