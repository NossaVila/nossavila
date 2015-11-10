class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, length: {minimum: 2, maximum: 30}, presence: true
  validates :last_name, length: {minimum: 3, maximum: 30}, presence: true
  # cep: save only numbers
  # validates :cep, length: { s: 8 }, presence: true, format: { with: /\d{5}-?\d{3}/ }
  validates :cep, presence: true, format: { with: /\d{5}-?\d{3}/ }
  # validates :username, length: { in: 5..12 }, uniqueness: true, presence: true
  # has_secure_password
  # validates :password, length: { minimum: 8 }, presence: true
  validates :address, length: {minimum: 5}, presence: true
  # validates :email, uniqueness: true, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z])+   a\.[a-z]+\z/i }
  validates :cpf, uniqueness: true, presence: true
  has_many :services
  def name
    self.first_name + " " + self.last_name
  end
  
  def is_valid_cpf?
    true
  end

end
