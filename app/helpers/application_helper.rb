module ApplicationHelper

	# a helper method to upload or display avatars 
	def get_user_avatar(user, size)
		if user.user_avatar.attached?
		   user.user_avatar.variant(resize: "#{size}x#{size}!")
		else
			if user.email != ""
		   		gravatar_image_url(user.email, size: size)
		   	else
		   		gravatar_image_url('default@fortresstechgh.com', size: size)
		   	end
		end
	end

	def get_label_status
		return "Set Active?"
	end

	def get_label_avatar
		"Avatar"
	end

	def get_label_name
		"Name"
	end

	def get_label_description
		"Description"
	end

	def get_label_date
		"Date"
	end

	def get_label_time
		"Time"
	end

	def show_time_format_hint
		"HH:MM:SS -> 01:15:01"
	end

	def get_membership_type
		"Membership"
	end

	def time_format(datetime)
	  datetime.strftime('%H:%M:%S') unless datetime.blank?
	end

	def date_format(datetime)
		datetime.strftime('%Y %b %d') unless datetime.blank?
	end

	def get_active_status
		"Active"
	end
	def get_in_active_status
		"Inactive"
	end

	def delete_prompt(obj)
		delete_prompt_logic(obj)
	end
	
	private

	   def delete_prompt_logic(obj)
		   	if obj == "activity"
				"Are you sure to Delete " + obj.activity_name.upcase + " activity from the records?"
			elsif obj == "role"
				"Are you sure to Delete " + obj.role_name.upcase + " role from the records?"
			elsif obj == "user_activity"
				"Are you sure to Delete " + obj.activity.activity_name.upcase + " activity from the  User Activity records?"	
			elsif obj == "user"
				"Are you sure to Delete " + obj.user_first_name.upcase + " " + obj.user_last_name.upcase + " from the User records?"	
			else 
				"Are you sure to Delete the selected record from the system database?"		
		    end
	   end	
		# a private method to check if the user email is empty
	   def current_user_email_has_value
	   	   if  current_user.try(:email) == nil
	   	   	   return false
	   	   	else
	   	   		return true
	   	   end
	   end
end
