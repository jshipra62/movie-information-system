class Movie < ApplicationRecord
  validates :title, presence: true
  validates :synopsis, presence: true
  validates :rating, presence: true
  validates :rdate, presence: true   

  has_attached_file :image,  :styles => {
      :thumb => "250x350#",
      :small  => "150x150>",
      :medium => "1000x500" }
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  

  has_many :shows,    dependent: :destroy
  has_many :books,    dependent: :destroy
  has_many :reviews,    dependent: :destroy
  has_and_belongs_to_many :languages

  validates :languages, presence: true
  
end
