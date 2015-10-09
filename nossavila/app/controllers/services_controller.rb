class ServicesController < ApplicationController

  def index
    unless (params[:category].nil?)
      @category = Category.find(params[:category])
    else
      @category = Category.find_by(name: "root")
    end
    @categories = Category.all
    @services = @category.services unless(@category.nil?)
  end

  def show
    id = params[:id]
    @service = Service.find(id)
  end
  
  def new 
    @services = Service.all
    @service = Service.new
  end
  
  def create
    @categories = Category.all
    @service = Service.new(params[:service])
    if @service.save
      flash[:notice] = "Novo serviço criado com sucesso"
      redirect_to @service
    else
      flash[:notice] = "Falha ao criar serviço"
      render :action => "new"
    end
  end
  
  def update
    @service = Service.find params[:id]
    @service.update_attributes!(params[:service])
    flash[:notice] = "Dados atualizados com sucesso"
    redirect_to service_path(@service)
  end
  
  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    flash[:notice] = "Serviço removido"
    redirect_to services_path
  end
end