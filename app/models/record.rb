class Record < ApplicationRecord
  belongs_to :artist
  enum condition: [:mint, :near_mint, :very_good_plus, :very_good, :good_plus, :good, :fair, :poor]
  enum genre: [:rock, :pop, :electronic, :folk, :world, :country, :jazz, :funk, :soul, :hip_hop, :classical, :latin, :reggae, :stage_and_screen, :blues, :non_music, :rap]
  validates :artist, presence: true
  validates :title, presence: true
  validates :year, presence: :true
end
