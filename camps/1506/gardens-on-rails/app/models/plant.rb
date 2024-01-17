class Plant < ApplicationRecord
  # Relationships
  belongs_to :garden

  # Validations
  validates :name, presence: true
  validates :image_url, presence: true
end
