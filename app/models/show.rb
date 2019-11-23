class Show < ApplicationRecord
  belongs_to :theater
  belongs_to :movie
  has_many :books,    dependent: :destroy
  has_many :slots, dependent: :destroy 
                   accepts_nested_attributes_for :slots, 
                   :allow_destroy => true
  validates :slots, presence: true  
end
