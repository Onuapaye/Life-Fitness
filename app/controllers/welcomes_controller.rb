class WelcomesController < ApplicationController
	# before_action :stay_on_landingpage
	layout 'fitnezz_layouts/fitnezz_layout'
	
  def index

  end

  # This methods loads all activities to the landing page view
  # so their properties can be retreived and displayed on that page
  def landingpage
  	@our_activities = Activity.all
  end

 # private
end
