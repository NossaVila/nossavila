# -*- coding: utf-8 -*-
class ServicesController < ApplicationController
  include ServicesHelper
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
  end

  def show
    id = params[:id]
    @service = Service.find(id)
  end
  
  def new
    unless(user_signed_in?)
      store_location_for(:user, new_service_path)
      flash[:notice] = "É necessário estar logado para criar um serviço"
      flash[:state] = "red"
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
      flash[:state] = "green"
      flash[:notice] = "Novo serviço criado com sucesso"
      redirect_to service_path(@service)
    else
      flash[:state] = "red"
      flash[:notice] = "Falha ao criar serviço"
      render :action => "new"
    end
  end

  def edit
    @service = Service.find paramsCategory[:id]
    @categories = Category.where.not(name: "root")
  end

  def update
    @categories = Category.where.not(name: "root")
    @service = Service.find params[:id]
    if @service.update_attributes(service_params)
      category_wrapper(@service, params[:service][:categories])
      flash[:state] = "green"
      flash[:notice] = 'Dados atualizados com sucesso'
      redirect_to service_path(@service)
    else 
      flash[:state] = "red"
      flash[:notice] = 'Falha ao atualizar serviço'
      render :action => "edit"
    end
  end
  
  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    flash[:state] = "green"
    flash[:notice] = 'Serviço removido'
    redirect_to services_path
  end
  
  def service_params
    params.require(:service).permit(:title, :description, :user_id)
  end
end
