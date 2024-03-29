class ApplicationController < ActionController::Base
	
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
  
	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :ptj])
	  devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
	end

	def after_sign_in_path_for(resource_or_scope)
		if resource_or_scope.is_a?(User) && resource_or_scope.admin?
		  admin_admin_page_path # 管理者ダッシュボードへのパス
		else
		  member_path # 一般ユーザーのリダイレクト先
		end
	end

	def after_sign_out_path_for(resource_or_scope)
		root_path # ここにリダイレクト先のパスを指定
	end
	
end

# configure_permitted_parametersに関して、sing_upとsign_inのパラメータを許可している。
# is_a?(User)メソッドは、引数のオブジェクトが指定したクラスのインスタンスである場合にtrueを返す。この場合、Userクラスかどうか