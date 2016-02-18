class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to '/login' unless current_user
  end
  
  def require_admin
    redirect_to '/main' unless current_user.admin_user?
  end
  
  def require_normal_user
    redirect_to '/main' unless current_user.normal_user?
  end
#https://www.youtube.com/watch?v=rSlDEvtk6lA
 # def set_flash(type, object: nil)
 #   flash[:from] = action_name
 #   flash[:type] = type
 #   flash[:object_type] = object.class.name
 #   flash[:object_id] = object.id
 # end
end
