class ApplicationController < ActionController::Base

      before_action :configure_permitted_parameters, if: :devise_controller?

      def after_sign_in_path_for(resourse)
      	user_path(current_user.id)
      end

	  protected
      def configure_permitted_parameters
      	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
        devise_parameter_sanitizer.permit(:sign_in, keys:[:name])
        devise_parameter_sanitizer.permit(:account_update, keys:[:name, :email, :password, :introduction, :profile_image_id])
      end
end
