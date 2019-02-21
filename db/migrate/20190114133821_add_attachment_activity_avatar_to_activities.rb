class AddAttachmentActivityAvatarToActivities < ActiveRecord::Migration[5.2]
  def change
  	add_attachment :activities, :activity_avatar
  end
end
