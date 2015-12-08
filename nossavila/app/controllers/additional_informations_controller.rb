class AdditionalInformationsController < ApplicationController
  respond_to :html, :js
  def index

  end
  def create
    @user = User.find(params[:user])
    @additional_info = AdditionalInformation.new(additional_information_params)
    @user.additional_informations << @additional_info
    flash[:notice] = "Informacao Adicionada" if @additional_info.save
    respond_with( @additional_info, :layout => !request.xhr? )
  end

  def additional_information_params
    params.require(:additional_information).permit(:title, :information, :user_id)
  end
end
