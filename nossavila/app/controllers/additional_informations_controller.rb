class AdditionalInformationsController < ApplicationController
  def index

  end
  def create
    @additional_info = AdditionalInformation.new(additional_information_params)
    respond_to do |format|
      if @result = @additional_info.save
        format.html 
        format.js { render 'create.js.haml' }
      else
        format.html { render :action => "new" }  
        format.js
      end
    end
  end

  def additional_information_params
    params.require(:additional_information).permit(:title, :information, :user_id)
  end
end
