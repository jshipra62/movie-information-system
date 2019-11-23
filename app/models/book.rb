class Book < ApplicationRecord
  belongs_to :theater
  belongs_to :movie
  belongs_to :show
  belongs_to :slot
  belongs_to :user

  validates :bseat, presence: true
  validates_numericality_of :bseat, :greater_than => 0.0

end
