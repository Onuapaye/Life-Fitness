class Activity < ApplicationRecord

  # ----ASSOCIATION OF MODELS----

  #activity has many user_activities and many user through
  #the user_activity joint table
  has_many :user_activities, inverse_of: :activity
  has_many :users, through: :user_activities


  TIME_FORMAT_REGEX = /(?:[01]\d|2[0-3]):(?:[0-5]\d):(?:[0-5]\d)/

	
  # ----MODEL VALIDATIONS----
  validates :activity_name, presence: true, uniqueness: true, null: false, length: {minimum:3, maximum:45}
  validates :activity_description, presence: true, null: false, length: {minimum:3}
  validates :activity_min_duration, presence: true, null: false
  validates :activity_max_duration, presence: true, null: false
  validates_format_of :activity_min_duration, :with => TIME_FORMAT_REGEX, on: :create, :message => "has invalid time format"
  validates_format_of :activity_max_duration, :with => TIME_FORMAT_REGEX, on: :create, :message => "has invalid time format"

  validates_format_of :activity_min_duration, :with => TIME_FORMAT_REGEX, on: :update, :message => "has invalid time format"
  validates_format_of :activity_max_duration, :with => TIME_FORMAT_REGEX, on: :update, :message => "has invalid time format"
  # active storage image handling
  # has_one_attached :activity_avatar

  validates :activity_avatar, presence: true

  # attaching image using the Paperclip gem installed and resizing using the ImageMagick gem
  # this will help upload image into the form
  validates :activity_avatar, attachment_presence: true
  has_attached_file :activity_avatar, styles: { medium: "300x300>", thumb: "100x100>", small: "10x10>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :activity_avatar, content_type: /\Aimage\/.*\z/#["image/jpeg", "image/jpg", "image/png", "image/svg"]#
  validates_with AttachmentSizeValidator, attributes: :activity_avatar, less_than: 5.megabytes

end
