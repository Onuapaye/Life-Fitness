class Role < ApplicationRecord

	# ----ASSOCIATION OF MODELS----

  # a role has many users is the type of association
  # which is many to one or one-to-many
  has_many :users

  # ----MODEL VALIDATIONS----
  validates :role_name, presence: true, uniqueness: true, length: { minimum: 5, maximum: 45}, null: false

end
