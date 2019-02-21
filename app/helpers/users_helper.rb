module UsersHelper

	def get_user_first_name
		"First Name"
	end

	def get_user_last_name
		"First Name"
	end

	def get_user_first_name
		"First Name"
	end

	def get_user_full_name
		fname = @user.user_first_name + " " + @user.user_last_name
	end

	def get_user_age
		"Age"
	end

	def get_user_telephone
		"Mobile"
	end

	def get_user_email
		"E-mail"
	end


GET_USER_TYPE = {'admin_full' => 'Administrator', 'admin_short' => 'admin', 'member' => 'Member', 'other' => 'other'}


end
