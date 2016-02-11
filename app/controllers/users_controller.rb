class UsersController < ApplicationController
  before_action :require_user, only: [:new, :create,:edit,:update,:destroy]
  before_action :require_admin,only: [:new, :create,:edit,:update,:destroy]
  before_action :require_normal_user,only: [:edit, :update]
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
	
	
  	def edit

  	end
  	
  	def update
  		
  	end
  	
  	def destroy
  		
  	end

  	private
  	def user_params
  		# debugger # ---> Use to debug the app in console
    	  params.required(:user).permit(:nick_name,:first_name,:last_name,:email,:password,:password_confirmation,:admin,:profile_photo)
    	  
    	  
  	end

end
