# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  layout 'login'
  before_action :configure_sign_in_params, only: [:create, :show]
  # after_action :after_sign_in_path_for, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  def index
    @users = User.all

    respond_to do |format|
      format.js
      format.html { render :layout => 'layouts/application' }
    end
  end

  # GET /resource/id
  def show
    if current_user.nil?
      redirect_to root_url
    else
      # u_id = current_user.id
      @user = User.find(params[:id]) #to retrieve a user record based on the id passed from the params
      u_id = params[:id]
      # retrieve values from the user_activities table and from the activities table based on a foreign key
      # from the user_activities table matching that of activities and user_id in the user_activities table
      # matching that of the id in the users table
      @user_activities = UserActivity.joins(:activity).where("activities.id = user_activities.activity_id").where("user_activities.user_id = #{u_id}")
    
        respond_to do |format|
          format.js
          format.html { render :layout => 'layouts/application' }
        end
    end 
  end

  # POST /resource/sign_in
  def create
    super
    # after_sign_in_path_for(resource)
  end

  # DELETE /resource/sign_out
  def destroy
    # super
    user_log_out
  end

  protected

    def after_sign_in_path_for(resource)
      current_user
      dash_path
    end

    def user_log_out     
      sign_out @user
      # redirect_to '/users/sign_in' 
      redirect_to landhere_path
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in) { |m| m.permit(:email, :password, :remember_me, :id)}
      # devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    end
end
