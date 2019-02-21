class Company < ApplicationRecord

	validates :comp_name, presence: true, limit: 100
	validates :comp_telephone, presence: true, limit: 15
	validates :comp_mobile, limit: 15
	validates :comp_about_us, presence: true
	validates :comp_coordinate_long, presence: true
	validates :comp_coordinate_lat, presence: true
	validates :comp_address_l1, presence: true
	validates :comp_country_name, presence: true
	validates :comp_city_name, presence: true

	  validates :company_logo, presence: true

	  # attaching image using the Paperclip gem installed and resizing using the ImageMagick gem
	  # this will help upload image into the form
	  validates :company_logo, attachment_presence: true
	  has_attached_file :company_logo, styles: { medium: "100x100>", thumb: "92x22>", small: "10x10>" }, default_url: "/images/:style/missing.png"
	  validates_attachment_content_type :company_logo, content_type: /\Aimage\/.*\z/#["image/jpeg", "image/jpg", "image/png", "image/svg"]#
	  validates_with AttachmentSizeValidator, attributes: :company_logo, less_than: 2.megabytes
end
