class User < ActiveRecord::Base
    validates :first_name, length: {minimum: 2, maximum: 30}, presence: true
    validates :last_name, length: {minimum: 3, maximum: 30}, presence: true
    # cep: save only numbers
    validates :cep, length: { is: 8 }, presence: true, format: { with: /\d{5}-?\d{3}/ }
    validates :username, lenght: { in: 5..12 }, uniquiness: true, presence: true
    has_secure_password
    validates :password, length: { minimum: 8 }, allow_nil: true
    validates :address, length: {minimum: 5}, presence: true
    validates :housenumber, numericality: { only_integer: true }
    validates :email, uniquiness: true, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
    validates :cpf, uniquiness: true, presence: true
    has_many :services
end