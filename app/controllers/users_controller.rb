class UsersController < ApplicationController
  #make that only the  authenticated user can user the actions specified
  before_action :require_user , only: [:new,:index,:create,:edit,:update,:user_list,:destroy]
  #Only a Admin User can use the actions except for edit and update beacuse the normal user can use too
  before_action :require_admin, only: [:new,:index,:create,:edit,:update,:user_list,:destroy],except: [:edit,:update]

 #before_action :require_normal_user,only:[:edit,:update]
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
  	      flash[:notice] = 'Usuario creado Exitoxamente'
          
          #set_flash :success, object: @user

          redirect_to '/'

  	    else
          flash[:notice] = 'No se pudo crear el ususario'
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
          #ask id the user to edit is admin
       if current_user.admin ==true
          if @user.update(user_params)
            flash[:notice] = 'El usuario fue editado exitoxamente'
            redirect_to '/user_list'
          else
            flash[:notice] = 'El usuario no se pudo editar'
            render 'edit'
          end

        else
          #Ask if the user is normal and if the id of the current user and @user are the same
          #the normal user only can edit itself
          if current_user.admin ==false && current_user.id == @user.id
            if @user.update(user_params)
              flash[:notice] = 'Tu usuario fue editado exitoxamente'
              redirect_to '/'
            else
              flash[:notice] = 'Tu usuario no se pudo editar'
              render 'edit'
            end
          else
            flash[:notice] = 'Un error ha ocurrido'
            render 'edit'
          end
        end      
  	end
  	
  	def destroy
  		@user=User.find(params[:id])
      @user.destroy
      flash[:notice] = 'El usuario fue eliminado exitoxamente'
      redirect_to '/user_list'
  	end

  	private
  	def user_params
  		# debugger # ---> Use to debug the app in console
    	  params.required(:user).permit(:nick_name,:first_name,:last_name,:email,:password,:password_confirmation,:admin,:profile_photo)
    	  
    	  
  	end
    
    

end
