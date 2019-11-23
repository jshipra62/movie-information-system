class Language < ApplicationRecord
  has_and_belongs_to_many :movies, dependent: :destroy
  validates :language, presence: true
  validates_uniqueness_of :language, :case_sensitive => false
end
