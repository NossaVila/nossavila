class CategoriesController < ApplicationController

  def index
    # save params[:service][:categories] on session
    if(params[:root].nil?)
      @root = Category.find_by(name: "root")
    else
      @root = Category.find_by(name: params[:root])
    end
    @categories = @root.subcategories unless @root.nil?
    if(@categories[0].nil?)
      redirect_to services_path(:category => @root.id)
    end
  end

  def show
    id = params[:id]
    @category = Category.find_by(id)
  end
end