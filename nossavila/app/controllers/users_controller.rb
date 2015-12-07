# -*- coding: utf-8 -*-
class UsersController < ApplicationController  
  def show
    if params[:id]
      @services = User.find(params[:id]).services
    elsif user_signed_in? 
      @services = current_user.services
    else
      store_location_for(:user, new_service_path)
      flash[:notice] = "É necessário estar logado para acessar seu perfil"
      flash[:state] = "red"
      redirect_to new_user_session_path
    end
  end
end
