# -*- coding: utf-8 -*-
class UsersController < ApplicationController
  include OferringsHelper
  def show
    if params[:id]
      @user = User.find(params[:id])
      if @user.nil?
        toast("red", "O usuário solicitado não existe")
        redirect_to services_path
      end
      @services = @user.services
    elsif user_signed_in?
      @user = current_user
      @services = current_user.services
    else
      toast("red", "É necessário estar logado para acessar seu perfil")
      redirect_to new_user_session_path
    end
  end

end
