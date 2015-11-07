# -*- coding: utf-8 -*-
class ServicesController < ApplicationController
  def index
    if params[:category].nil?
      @services = Service.all
    end
    
    unless (params[:category].nil?)
      @category = Category.find(params[:category])
    else
      @category = Category.find_by(name: "root")
    end
    
    @categories = Category.where.not(name: "root")
    @services = @category.services unless(@category.nil?)
  end

  def show
    id = params[:id]
    @service = Service.find(id)
  end
  
  def new
    unless(user_signed_in?)
      store_location_for(:user, new_service_path)
      flash[:partial] = "noticepartial"
      flash[:state] = "red"
      flash[:text] = "É necessário estar logado para criar um serviço"
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
    Category.find_by(name: "root").services << @service
    unless(params[:service][:categories].nil?)
      params[:service][:categories].each do |category|
        cat = Category.find_by(name: category)
        cat.services << @service
      end
    end
    flash[:partial] = "noticepartial"
    if @service.save
      flash[:state] = "green"
      flash[:text] = "Novo serviço criado com sucesso"
      redirect_to service_path(@service)
    else
      flash[:state] = "red"
      flash[:text] = "Falha ao criar serviço"
      render :action => "new"
    end
  end

  def edit
    @service = Service.find params[:id]
    @categories = Category.where.not(name: "root")
  end

  def update
  	flash[:partial] = "noticepartial"
    @categories = Category.where.not(name: "root")
    @service = Service.find params[:id]
    if @service.update_attributes!(service_params)
      flash[:state] = "green"
      flash[:text] = 'Dados atualizados com sucesso'
      redirect_to service_path(@service)
    else 
      flash[:state] = "red"
      flash[:text] = 'Falha ao atualizar serviço'
      render :action => "edit"
    end
  end
  
  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    flash[:state] = "green"
    flash[:text] = 'Serviço removido'
    redirect_to services_path
  end
  
  def service_params
    params.require(:service).permit(:title, :description, :user_id)
  end
end
