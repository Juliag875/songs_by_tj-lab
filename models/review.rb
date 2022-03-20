class Review < ApplicationRecord
  belongs_to :songs
  belongs_to :super_fan

   # A SuperFan can only leave a review once per song.
  validates :super_fan_id, uniqueness: { scope: :song_id, message: "already has review" }
  
  # must have a rating between 1 and 10
  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
end
