class HomeController < ApplicationController
  
  # brincando de serviços
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
end