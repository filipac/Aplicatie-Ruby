class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :resolve_layout
  def render_403 message
  	render :status => :forbidden, :text => "Forbidden"
  end
  def index
    if !user_signed_in?
    authenticate_user!
  end
  end

  def parola 
	if !user_signed_in?
		authenticate_user!
	end
  end

  private

  def resolve_layout
    if current_user.nil?
      "login"
    else
      "application"
    end
  end
end
