class Company < ActiveRecord::Base
    # estabelecimentos
    validates :name, length: { in: 2..30 }, presence: true
    validates :description, length: { in:2..100 }, presence: true
    validates :address, length: {minimum: 5}, presence: true
    validates :cep, presence: true, format: { with: /\d{5}-?\d{3}/ }
    validates :cnpj,  uniqueness: true, presence: true
    validates :phone_number, presence: true, length: { is: 8 }
    validates :area_code, presence:true, length: { is: 2 }
    validates :site, format: { with: /(.*).(.*)/ }
    # validates :site, format: { with: /(https?:\/\/(?:www\.|(?!www))[^\s\.]+\.[^\s]{2,}|www\.[^\s]+\.[^\s]{2,})/ }
    belongs_to :user, class_name: 'User'
    has_and_belongs_to_many :categories
end