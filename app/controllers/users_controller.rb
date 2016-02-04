class UsersController < ApplicationController
  def new
  	@user=User.new
  end

	def create
	    @user =User.new(user_params)
	    if @user.save
	     # session[:user_id]=@user.id
	      redirect_to '/'
	    else
	      render 'new'
	    end
	end
	
	private
  	def user_params
  		# debugger # ---> Use to debug the app in console
    	  params.required(:user).permit(:nick_name,:first_name,:last_name,:email,:password,:password_confirmation,:admin,:profile_photo)
    	  
    	  
  	end
  	

end
