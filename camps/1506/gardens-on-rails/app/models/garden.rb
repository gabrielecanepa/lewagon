class Garden < ApplicationRecord
  # Relationships
  has_many :plants

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :banner_url, presence: true
end
