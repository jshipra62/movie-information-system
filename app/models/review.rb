class Review < ApplicationRecord
  validates :rating, presence: true
  validates :comment, presence: true

  belongs_to :user
  belongs_to :movie

  def check(m,u)
    if u == m
      return 1
    else 
      return 0
    end
  end
end
