class ApplicationController < ActionController::Base
	
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
  
	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :ptj])
	  devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
	end

	def after_sign_in_path_for(resource_or_scope)
		if resource_or_scope.is_a?(User) && resource_or_scope.admin?
		  admin_dashboard_path 
		else
		  member_path
		end
	end

	def after_sign_out_path_for(resource_or_scope)
		root_path
	end
	
end
