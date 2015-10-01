class Service < ActiveRecord::Base
  attr_accessible :title, :description, :category, :created_at, :updated_at
  belongs_to :user
end