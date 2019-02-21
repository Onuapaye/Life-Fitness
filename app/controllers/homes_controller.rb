class HomesController < ApplicationController
	before_action :check_user_has_signed_in

  def index
  end

  def dashboard
  end

  private

  # check if the user has signed in before accessing the controller
  def check_user_has_signed_in
  	if current_user.nil?
  	  redirect_to new_user_session_path
  	end
  end

end
