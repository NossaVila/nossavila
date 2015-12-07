# -*- coding: utf-8 -*-
class UsersController < ApplicationController  
  def show
    unless user_signed_in?
      store_location_for(:user, new_service_path)
      flash[:notice] = "É necessário estar logado para criar um serviço"
      flash[:state] = "red"
      redirect_to new_user_session_path
    end
    @services = current_user.services
  end
end
