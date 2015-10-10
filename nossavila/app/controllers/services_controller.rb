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

  def edit
  end
  
  def show
    id = params[:id]
    @service = Service.find(id)
  end
  
  def new 
    @categories = Category.where.not(name: "root")
    @services = Service.all
    @service = Service.new
  end
  
  def create
    @categories = Category.all
    @service = Service.new(service_params)
    if @service.save
      flash[:notice] = 'Novo serviço criado com sucesso'
      redirect_to service_path(@service)
    else
      flash[:notice] = 'Falha ao criar serviço'
      render :action => "new"
    end
  end
  
  def update
    @service = Service.find params[:id]
    if @service.update_attributes(service_params)
      flash[:notice] = 'Dados atualizados com sucesso'
      redirect_to service_path(@service)
    else 
      flash[:notice] = 'Falha ao atualizar serviço'
      render :action => "edit"
    end
  end
  
  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    flash[:notice] = 'Serviço removido'
    redirect_to services_path
  end
  
  def service_params
    params.require(:service).permit(:title, :description, :user_id)
  end
end