class ServicesController < ApplicationController
  def index
    @categories = ["education", "transport", "recreation"]
    @services = Service.all
  end

  def show
  
  end

end