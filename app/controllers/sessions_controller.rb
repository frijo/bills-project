class SessionsController < ApplicationController
  	def login
  	end
  	
  	def authentication
	  @user = User.find_by_nick_name(params[:session][:nick_name])
	  if @user && @user.authenticate(params[:session][:password])
	    session[:user_id] = @user.id
	    redirect_to '/'
	  else
	    redirect_to '/login'
	  end 
	end
	
	def logout
		session[:user_id]=nil
    	redirect_to '/'    	
	end
end
