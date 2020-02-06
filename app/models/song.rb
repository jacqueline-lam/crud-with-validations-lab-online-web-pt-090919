class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: { 
    scope: [:release_year, :artist_name],
    message: 'cannot be released by the same artist in the same year' 
  }
  validates :released, inclusion: { in: [ true, false ] }
  validates :release_year, presence: true, if: :released, numericality: { 
    only_integer: true, 
    less_than_or_equal_to: Date.today.year 
  }
  validates :artist_name, presence: true
end
