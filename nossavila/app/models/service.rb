class Service < ActiveRecord::Base
  validates :title, length: {in: 2..16}
  validates :description, length: {in: 10..132}
  belongs_to :user, class_name: 'User'
end