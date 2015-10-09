class CategoriesController < ApplicationController

  def index
    if(params[:root].nil?)
      @root = Category.find_by(name: "root")
    else
      @root = Category.find_by(name: params[:root])
    end
    
    @categories = @root.subcategories
    if(@categories[0].nil?)
      redirect_to services_path(:category => @root.id)
    end
  end

  def show
    id = params[:id]
    @category = Category.find(id)
  end
end