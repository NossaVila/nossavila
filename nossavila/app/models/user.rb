class User < ActiveRecord::Base
    validates :name, lenght: {minimum: 3, maximum: 30}
    validates :cep, lenght: { is: 9 } #depois por a regex para verificar o formato
    
    has_many :services
end