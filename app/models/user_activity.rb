class UserActivity < ApplicationRecord

	# ----ASSOCIATION OF MODELS----

  # a UserActivity belongs to a User
  # and UserActivity belongs to an Activity
  belongs_to :user, inverse_of: :user_activities
  belongs_to :activity, optional: true, inverse_of: :user_activities 

  accepts_nested_attributes_for :activity, :user

  # ----MODEL VALIDATIONS----
  validates_presence_of :user_activity_end, presence: true, null: false, :format => "%H:%M:%S", :message => "cannot be empty"
  validates_presence_of :user_activity_start, presence: true, null: false,:format => "%H:%M:%S", :message => "cannot be empty"
  validates_presence_of :user_activity_date, presence: true, null: false,  :message => "cannot be empty"
  validates_presence_of :user_activity_note, presence: true, length: { minimum: 10 }, null: false, :message => "cannot be empty"

  validates :user, presence: true
  validates :activity, presence: true
end
