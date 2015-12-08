# -*- coding: utf-8 -*-
class UsersController < ApplicationController  
  def show
    if params[:id]
      @user = User.find(params[:id])
      if @user.nil?
        flash[:notice] = "O usuário solicitado não existe"
        flash[:state] = "red"
        redirect_to services_path
      end
      @services = @user.services
    elsif user_signed_in?
      @user = current_user
      @services = current_user.services
    else
      flash[:notice] = "É necessário estar logado para acessar seu perfil"
      flash[:state] = "red"
      redirect_to new_user_session_path
    end
  end
end
