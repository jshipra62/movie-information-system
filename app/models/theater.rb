class Theater < ApplicationRecord
  validates :name, presence: true
  validates :seats, presence: true
  validates :price, presence: true

  validates_numericality_of :seats, :greater_than => 0.0
  validates_numericality_of :price, :greater_than => 0.0

  has_many :shows,    dependent: :destroy
  has_many :books,    dependent: :destroy

end
