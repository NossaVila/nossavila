module UserHelper
    def name
        self.first_name + self.last_name
    end
    
    def is_valid_cpf?
        DocumentosBr.valid-cpf?(self.cpf)
    end
end