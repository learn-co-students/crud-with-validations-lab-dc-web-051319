# frozen_string_literal: true

class Song < ApplicationRecord
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  validates :release_year, presence: true, numericality: { less_than_or_equal_to: Time.now.year }, if: :released_bool
  validate :twice_in_year?

  def released_bool
    released == true
  end

  def twice_in_year?
    songs = Song.where(title: title)
    if songs.pluck(:release_year, :artist_name).include?([release_year, artist_name])
      errors.add(:title, 'Song with same Title already released this year.')
    end
  end
end
