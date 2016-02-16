class UsersController < ApplicationController
  before_action :require_user, only: [:new,:index,:create,:user_list,:edit,:update,:destroy]
  before_action :require_admin, only: [:new,:index,:create,:user_list,:edit,:update,:destroy]
  before_action :require_normal_user, only: [:edit,:update]
    def new
    	@user=User.new
    end
    def index
      @users= User.all

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

    def user_list
     @users= User.all

    end
	
  	def edit
      @user=User.find(params[:id])
  	end
  	
  	def update
  		 @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to 'main'
      else
        render 'edit'
      end
  	end
  	
  	def destroy
  		@user=User.find(params[:id])
      @auser.destroy
  	end

  	private
  	def user_params
  		# debugger # ---> Use to debug the app in console
    	  params.required(:user).permit(:nick_name,:first_name,:last_name,:email,:password,:password_confirmation,:admin,:profile_photo)
    	  
    	  
  	end

end
