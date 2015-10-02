class User < ActiveRecord::Base
    validates :first_name, lengt: {minimum: 2, maximum: 30}
    validates :last_name, length: {minimum: 3, maximum: 30}
    validates :cep, length: { is: 9 } #depois por a regex para verificar o formato
    # regex para verificar cep /\d{5}-?\d{3}/ - usuário pode entrar com cep ou sem hifen
    
    has_many :services
end