# -*- coding: utf-8 -*-
class  CompaniesController < ApplicationController
  include CompaniesHelper
  include OferringsHelper
  def index
    @categories = []
    unless (params[:category].nil?)
      @categories << Category.find(params[:category])
    else
      unless params[:company].nil? or params[:company][:categories].nil?
        params[:company][:categories].each do |category|
          @categories << Category.find_by(name: category)
        end
      else
        @categories << Category.find_by(name: "root")
      end
    end
    @navcategories = Category.find_by(name: "root").subcategories
    @companies = []
    @categories.each do |category|
      unless(category.nil?)
        category.companies.each do |company| 
          @companies << company  
        end
      end
    end
    @companies = @companies.uniq
  end
  
  def show
    id = params[:id]
    @company = Company.find_by(:id => id)
  rescue ActiveRecord::RecordNotFound
    toast("red", "Não foi encontrado esse serviço.")
    redirect_to index
  end
  
  def new
    unless(user_signed_in?)
      store_location_for(:user, new_company_path)
      toast("red", "É necessário estar logado para registrar um estabelecimento")
      redirect_to new_user_session_path
    end
    @categories = Category.where.not(name: "root")
    @companies = Company.all
    @company = Company.new
  end
  
  def create
    @categories = Category.all
    @company = Company.new(company_params)
    @company.user = current_user
    if @company.valid?
      Category.find_by(name: "root").companies << @company
      category_wrapper_comp(@company, params[:company][:categories])
    end
    if @company.save
      toast("green", "Novo estabelecimento criado com sucesso")
      redirect_to company_path(@company)
    else
      toast("red", "Falha ao criar estabelecimento")
      render :action => "new"
    end
  end

  def edit        
    @company = Company.find params[:id]
    @categories = Category.where.not(name: "root")
  end
  
  def update
    @categories = Category.where.not(name: "root")
    @company = Company.find params[:id]
    if @company.update_attributes(company_params)
      category_wrapper_comp(@company, params[:company][:categories])
      toast("green", "Dados atualizados com sucesso")
      redirect_to company_path(@company)
    else 
      toast("red", "Falha ao atualizar estabelecimento")
      render :action => "edit"
    end
  end
  
  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    toast("green", "Estabelecimento removido")
    redirect_to companies_path
  end
  
  def company_params
    params.require(:company).permit(:name, :description, :address, :cep, :cnpj, :phone_number, :area_code, :site, :user_id)
  end
end
