class Service < ActiveRecord::Base
  validates :title, length: {in: 2..50}
  validates :description, length: {in: 10..300}
  belongs_to :user, class_name: 'User'
end