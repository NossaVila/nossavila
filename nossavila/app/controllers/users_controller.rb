class UsersController < ApplicationController
   def show
      
   end
   
   def create
      User.create!(params[:user]) unless params[:user][:password] != params[:user][:confirm_password]
            
      redirect_to users_path  
      
   end
   
   def update
       
   end
  
   def destroy
       
   end
   
   def new
      
   end
   
   def login
      
   end
   
   def logout
      
   end
   
end