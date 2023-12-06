class Movie < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  def flop?
    total_gross < 225_000_000
  end
end
