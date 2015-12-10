class Category < ActiveRecord::Base
   validates :name, presence: true
   has_and_belongs_to_many :services
   has_and_belongs_to_many :companie
   has_many :subcategories, class_name: "Category", foreign_key: "supercategory_id"
   belongs_to :supercategory, class_name: "Category"
end