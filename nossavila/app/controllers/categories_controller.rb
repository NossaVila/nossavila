class CategoriesController < ApplicationController

  def index
# how session is suposed to work here??
#    session[:selected] = params[:service][:categories]
#    if params[:selected].nil?
#      params[:selected] = session[:selected]
#    end
    @type = params[:type]
    if(params[:root].nil?)
      @root = Category.find_by(name: "root")
    else
      @root = Category.find_by(name: params[:root])
    end
    @categories = @root.subcategories unless @root.nil?
    if(@categories[0].nil?)
      if params[:type] == "service"
        redirect_to services_path(:category => @root.id)
      elsif params[:type] == "company"
        redirect_to companies_path(:category => @root.id)
      else
        redirect_to "/home"
      end
    end
  end

  def show
    id = params[:id]
    @category = Category.find_by(:id => id)
  end
end