# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  layout 'register'
  
  protect_from_forgery with: :exception
  before_action :configure_sign_up_params, only: [:create]
  before_action :save_user_params, only: [:create_user]
  before_action :configure_account_update_params, only: [:update, :edit, :custom_update]

  # GET /resource/sign_up
  def new
    super
  end

  def new_user
    @user = User.new
    respond_to do |format|
      format.js
      format.html { render :layout => 'layouts/application' }
    end
  end

  def create_user
    @user = User.new(save_user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to dash_path, notice: 'User account was successfully created. Confirmation details is sent to the email provided', :layout => 'layouts/application' }
        # format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new_user, :layout => 'layouts/application' }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    super
  end

  def custom_edit
    @user = User.find(params[:id])

    respond_to do |format|
      format.html { render :layout => 'layouts/application'}
      format.js
    end
  end

  def custom_update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update(configure_account_update_params)
        bypass_sign_in(@user)
        format.html { redirect_to dash_path, notice: 'User profile was successfully updated.' }
        # format.json { render :show, status: :ok, location: @user_activity }
        format.js
      else
        format.html { render :custom_edit, :layout => 'layouts/application' }
        # format.json { render json: @user_activity.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up) { |m| m.permit(:user_first_name, :user_telephone, :user_last_name, :user_age, :user_status, :user_avatar, :role_id, :email, :password, :password_confirmation, :remember_me)}
      # devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    end

    def save_user_params
      params.fetch(:user, {}).permit(:user_first_name, :user_telephone, :user_last_name, :user_age, :user_status, :user_avatar, :role_id, :email, :password, :password_confirmation)
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update) { |m| m.permit(:id, :user_first_name, :user_last_name, :user_age, :user_status, :user_telephone, :user_avatar, :role_id, :email, :password, :current_password, :remember_me)}
      # devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    end

    # The path used after sign up.
    def after_sign_up_path_for(resource)
      # new_user_confirmation(resource)
      # '/users/confirmation/new'
      '/users/sign_in'
      # super(resource)
    end

    # The path used after sign up for inactive accounts.
    def after_inactive_sign_up_path_for(resource)
      # super(resource)
      # '/users/confirmation/new'
      '/users/sign_in'
    end
end
