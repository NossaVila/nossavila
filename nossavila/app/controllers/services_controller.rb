class ServicesController < ApplicationController
  def index
    @categories = ["education", "transport", "recreation"]
    @services = Service.all
  end

  def show
    id = params[:id]
    @service = Service.find(id)
  end

  
  def new
    @categories = Category.all
  end
end