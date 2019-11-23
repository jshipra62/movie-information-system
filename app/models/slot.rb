class Slot < ApplicationRecord
  belongs_to :show, optional: true
  has_many :books,    dependent: :destroy

  def remaining_seat(date, seats)
    booked_seat = books.where(bdate: date).sum(:bseat)    
    return seats-booked_seat
  end  

end
