class UserActivitiesController < ApplicationController

  before_action :is_user_authenticated
  before_action :set_user_activity, only: [:show, :edit, :update, :destroy]

  # attr_accessor :a_name, :a_id, :a_avatar, :ua_id, :ua_note, :ua_date, :ua_start, :ua_end, :ua_updated

  # GET /user_activities
  # GET /user_activities.json
  def index
    @user_activities = UserActivity.all
    @user_activities = @user_activities.order(id: :DESC)
  end

  # GET /user_activities/1
  # GET /user_activities/1.json
  def show
    respond_to do |format|
      format.js #{render :partial => 'showview', :layout => false}
      format.html #
    end
  end

  # GET /user_activities/new
  def new
    @user_activity = UserActivity.new
    @user_activity.activity

    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /user_activities/1/edit
  def edit
    respond_to do |format|
      format.js
      format.html
    end
  end

  # POST /user_activities
  # POST /user_activities.json
  def create
   
    @user_activity = current_user.user_activities.new(user_activity_params)

    respond_to do |format|

      if @user_activity.save
        format.html { redirect_to @user_activity, notice: 'User activity was successfully created.' }
        format.json { render :show, status: :created, location: @user_activity }
        format.js
      else
        format.js   { render :new, layout: false, content_type: 'text/javascript' }
        # format.json { render json: @user_activity.errors, status: :unprocessable_entity }
        # format.html { render :new }
      end

    end

  end

  # PATCH/PUT /user_activities/1
  # PATCH/PUT /user_activities/1.json
  def update
    respond_to do |format|
      if @user_activity.update(user_activity_params)
        format.html { redirect_to @user_activity, notice: 'User activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_activity }
      else
        format.html { render :edit }
        format.json { render json: @user_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @user_activity = UserActivity.find(params[:user_activity_id])
  end

  # DELETE /user_activities/1
  # DELETE /user_activities/1.json
  def destroy
    @user_activity.destroy
    respond_to do |format|
      format.html { redirect_to user_activities_url, notice: 'User activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Check for user_authentication before accessing this controller
    def is_user_authenticated
      if !user_signed_in?
        redirect_to new_user_session_path
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user_activity
      @user_activity = UserActivity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_activity_params
      params.require(:user_activity).permit(:activity_id, :user_activity_id, :user_activity_date, :user_activity_start, :user_activity_end, :user_activity_note )
      # params.fetch(:user_activity, {}).permit(:user_id, :activity_id, {user_activity: [:user_activity_date, :user_activity_start, :user_activity_end, :user_activity_note]})
      # params.permit(:user_id, :activity_id, :user_activity_date, :user_activity_start, :user_activity_end, :user_activity_note)
    end
end
