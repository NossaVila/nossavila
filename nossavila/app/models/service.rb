class Service < ActiveRecord::Base
  validates :title, length: {in: 2..50}
  validates :description, length: {in: 10..300}
  belongs_to :user, class_name: 'User'
  has_and_belongs_to_many :categories
  
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title like ?", "%#{query}%") 
  end
  
end