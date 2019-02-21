module UserActivitiesHelper

	def get_user_activity_date
		"#{get_activity_name} #{get_label_date}"
	end

	def get_user_activity_start_time
		"Start #{get_label_time}"
	end

	def get_user_activity_end_time
		"End #{get_label_time}"
	end

	def get_user_activity_note
		"#{get_activity_name} Note"
	end

	private
	def get_activity_name
		"Activity"
	end
end
