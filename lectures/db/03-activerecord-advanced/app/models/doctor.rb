class Doctor < ActiveRecord::Base
  has_many :interns
  has_many :consultations
  has_many :patients, through: :consultations

  validates :first_name, uniqueness: { scope: :last_name }
  validates :last_name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :email, format: { with: /\A.*@.*\.com\z/ }
end
