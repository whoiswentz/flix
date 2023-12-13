class Movie < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  scope :released_on_order, -> (direction) { order("released_on #{direction}") }
  scope :released, -> { released_on_order("desc").where("released_on < ?", Time.now) }

  def flop?
    total_gross < 225_000_000
  end
end
