# estabelecimentos

class  CompaniesController < ApplicationController
    def index
        if params[:category].nil?
         @companies = Company.all
        end
    
        unless (params[:category].nil?)
            @category = Category.find(params[:category])
        else
            @category = Category.find_by(name: "root")
        end
    
        @categories = Category.where.not(name: "root")
        @companies = @category.companies unless(@category.nil?)
    end
    
    def show
    id = params[:id]
    @company = Company.find(id)
    end
    
    def new
        unless(user_signed_in?)
            store_location_for(:user, new_company_path)
            flash[:partial] = "noticepartial"
            flash[:state] = "red"
            flash[:text] = "É necessário estar logado para criar um estabelecimento"
            redirect_to new_user_session_path
        end
        @categories = Category.where.not(name: "root")
        @companies = Company.all
        @company = Company.new
    end
    
    def create
        @categories = Category.all
        @company = Company.new(company_params)
        begin
            @company.user = current_user
            if @company.valid?
                Category.find_by(name: "root").companies << @company
            unless(params[:company][:categories].nil?)
                params[:company][:categories].each do |category|
                cat = Category.find_by(name: category)
                cat.companies << @company
                end
            end
            end
        end
        flash[:partial] = "noticepartial"
        if @company.save
            flash[:state] = "green"
            flash[:text] = "Novo estabelecimento criado com sucesso"
            redirect_to company_path(@company)
        else
            flash[:state] = "red"
            flash[:text] = "Falha ao criar estabelecimento"
            render :action => "new"
        end
    end

    def edit        
        @company = Company.find params[:id]
        @categories = Category.where.not(name: "root")
    end
    
    def update
        flash[:partial] = "noticepartial"
        @categories = Category.where.not(name: "root")
        @company = Company.find params[:id]
    
        if @company.update_attributes(company_params)
            flash[:state] = "green"
            flash[:text] = 'Dados atualizados com sucesso'
            redirect_to company_path(@company)
        else 
            flash[:state] = "red"
            flash[:text] = 'Falha ao atualizar estabelecimento'
            render :action => "edit"
        end
    end
    
    def destroy
    @company = Company.find(params[:id])
    @company.destroy
    flash[:state] = "green"
    flash[:text] = 'Estabelecimento removido'
    redirect_to companies_path
    end
    
    def company_params
    params.require(:company).permit(:name, :description, :address, :cep, :cnpj, :phone_number, :area_code, :site, :user_id)
    end
end
