# estabelecimentos

class  CompaniesController < ApplicationController
    
    def index
        @companies = Company.all
    end
    
    def show
    id = params[:id]
    @company = Company.find(id)
    end
    
    def new
    end
    
    def create
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
end
