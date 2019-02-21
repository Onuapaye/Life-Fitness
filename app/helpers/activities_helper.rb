module ActivitiesHelper

	def get_label_min_duration
		"Min #{get_label_time}"
	end

	def get_label_max_duration
		"Max #{get_label_time}"
	end

	# a helper method to upload or display activity avatars 
	def get_activity_avatar(activity, size)
		if activity.activity_avatar.attached?
		   activity.activity_avatar.variant(resize: "#{size}x#{size}!")
		else
			gravatar_image_url('activity@fitnessfortress.com', size: size)
		end
	end

end
