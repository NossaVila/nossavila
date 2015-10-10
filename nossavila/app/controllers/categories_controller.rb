class CategoriesController < ApplicationController

  def index
    if (params[:subcategories_id].nil?)
      @categories = Category.all
    end
    if(params[:root].nil?)
      @root = Category.find_by(name: "root")
    else
      @root = Category.find_by(name: params[:root])
    end
    
    @categories = @root.subcategories unless(params[:subcategories_id].nil?)
    if(@categories[0].nil?)
      redirect_to services_path(:category => @root.id)
    end
  end

  def show
    id = params[:id]
    @category = Category.find_by(id)
  end
end