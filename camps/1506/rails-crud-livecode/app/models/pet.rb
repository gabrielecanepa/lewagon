class Pet < ApplicationRecord
  SPECIES = ["dog", "cat", "rabbit", "snake", "turtle"].freeze

  validates :name, presence: true
  validates :species, inclusion: { in: SPECIES }
end
