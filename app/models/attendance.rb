class Attendance < ApplicationRecord

  belongs_to :user
  #has_one :comment

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :arrive

  with_options presence: true do
    validates :arrive_id, :attendance_day
    validates :arrive_id, numericality: { other_than: 1 } 
  end


 


end
