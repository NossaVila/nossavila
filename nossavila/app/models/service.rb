class Service < ActiveRecord::Base
  attr_accessible :title, :author, :description, :category, :created_at, :updated_at
end