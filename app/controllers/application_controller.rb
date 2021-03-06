class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		if current_user
			flash[:notice] = "Signed up successfully."
			user_path(current_user)
		else
			flash[:notice] = "Welcome!You have signed up successfully."
			user_path(current_user)
		end
	end

	protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name,:email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:name, :password, :password_confirmation) }
  end
end
