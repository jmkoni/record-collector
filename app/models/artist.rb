class Artist < ApplicationRecord
  has_many :records
  validates :name, presence: true
  enum band_type: [:solo, :band]
end
