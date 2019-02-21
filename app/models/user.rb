class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, , :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :trackable, :lockable#, :omniauthable

  # ----ASSOCIATION OF MODELS----

  # a member has only one role
  belongs_to :role #, foreign_key: "id"

  # a Member has many activities through
  # the member_activity model or table
  has_many :user_activities, inverse_of: :user
  has_many :activities, through: :user_activities

  
  # ----MODEL VALIDATIONS----
  validates :user_first_name, presence: true, uniqueness: true, length: { minimum: 1, maximum: 45}, null: false
  validates :user_last_name, presence: true, length: { minimum: 1, maximum: 45}, null: false
  validates :user_age, presence: true, numericality: { only_integer: true }, null: false
  # validates :user_telephone, numericality: { only_integer: true }, phone: true #, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }
  validates :user_telephone, :phone_number => {:ten_digits => true, :seven_digits => false, :allow_blank => false}
  validates :role_id, presence:true, null: false

  # attaching image using the Paperclip gem installed and resizing using the ImageMagick gem
  validates :user_avatar, presence: true

  # active storage image 
  has_one_attached :user_avatar

  #this will help upload image into the form
  # has_attached_file :user_avatar, styles: { medium: "300x300>", thumb: "100x100>", small: "10x10>" }, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :user_avatar, content_type: /\Aimage\/.*\z/ #["image/jpeg", "image/jpg", "image/png", "image/svg"]
  # validates_with AttachmentSizeValidator, attributes: :user_avatar, less_than: 5.megabytes

end
