class ApplicationController < ActionController::Base

	# protect_from_forgery with: :exception
	# before_action :configure_permitted_parameters, if: :devise_controller?
  
  # create a protected method to override the existing devise methods
  # in order to added the additional field values added to the Member model
  # 	protected

	 #  	def configure_permitted_parameters

		#   	# ActiveRecord::Base.transaction do
		# 	    devise_parameter_sanitizer.permit(:sign_up) { |m| m.permit(:user_first_name, :user_telephone, :user_last_name, :user_age, :user_status, :user_avatar, :role_id, :email, :password, :password_confirmation, :remember_me)}
		# 	    # devise_parameter_sanitizer.permit(:sign_up, key: [ :user_first_name, :user_last_name, :user_telephone, :user_age, :user_status, :user_avatar, :role_id, :email, :password, :password_confirmation, :remember_me ])

		# 	    devise_parameter_sanitizer.permit(:sign_in) { |m| m.permit(:email, :password, :remember_me)}
		# 	    # devise_parameter_sanitizer.permit(:sign_in, key: [ :email, :password, :remember_me ])
 
		# 	    devise_parameter_sanitizer.permit(:account_update) { |m| m.permit(:user_first_name, :user_last_name, :user_age, :user_status, :user_telephone, :user_avatar, :role_id, :email, :password, :current_password, :remember_me)}
		# 	    # devise_parameter_sanitizer.permit(:account_update, key: [ :user_first_name, :user_last_name, :user_telephone, :user_age, :user_status, :user_avatar, :role_id, :email, :password, :current_password, :remember_me ])
		#   	# end
		# end

end
