class ApplicationController < ActionController::Base
	
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
  
	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :ptj])
	  devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
	end

	def after_sign_in_path_for(resource_or_scope)
		member_path
	end
end

# configure_permitted_parametersに関して、sing_upとsign_inのパラメータを許可している。