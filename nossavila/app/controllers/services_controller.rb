# -*- coding: utf-8 -*-
class ServicesController < ApplicationController
  include ServicesHelper
  include OferringsHelper
  def index
    @categories = []
    unless (params[:category].nil?)
      @categories << Category.find(params[:category])
    else
      unless params[:service].nil? or params[:service][:categories].nil?
        params[:service][:categories].each do |category|
          @categories << Category.find_by(name: category)
        end
      else
        @categories << Category.find_by(name: "root")
      end
    end
    @navcategories = Category.find_by(name: "root").subcategories
    @services = []
    @categories.each do |category|
      unless(category.nil?)
        category.services.each do |service| 
          @services << service  
        end
      end
    end
    
    @services = @services.uniq
    
    if params[:search]
      @services = Service.search(params[:search]).order("created_at DESC")
    end

  end

  def show
    id = params[:id]
    @service = Service.find(id)
  rescue ActiveRecord::RecordNotFound
    toast("red", "Não foi encontrado esse serviço.")
    params[:id] = nil
    redirect_to services_path
  end
  
  def new
    unless(user_signed_in?)
      store_location_for(:user, new_service_path)
      toast("red", "É necessário estar logado para criar um serviço")
      redirect_to new_user_session_path
    end
    @categories = Category.where.not(name: "root")
    @services = Service.all
    @service = Service.new
  end
  
  def create
    @categories = Category.all
    @service = Service.new(service_params)
    @service.user = current_user
    if @service.valid?
      Category.find_by(name: "root").services << @service
      category_wrapper(@service, params[:service][:categories])
    end
    if @service.save
      toast("green", "Novo serviço criado com sucesso")
      redirect_to service_path(@service)
    else
      toast("red", "Falha ao criar serviço")
      render :action => "new"
    end
  end

  def edit
    @service = Service.find params[:id]
    @categories = Category.where.not(name: "root")
  end

  def update
    @categories = Category.where.not(name: "root")
    @service = Service.find params[:id]
    if @service.update_attributes(service_params)
      category_wrapper(@service, params[:service][:categories])
      toast("green", "Dados atualizados com sucesso")
      redirect_to service_path(@service)
    else 
      toast("red", "Falha ao atualizar serviço")
      render :action => "edit"
    end
  end
  
  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    toast("green", "Serviço removido")
    redirect_to services_path
  end
  
  def service_params
    params.require(:service).permit(:title, :description, :address, :user_id)
  end
end
