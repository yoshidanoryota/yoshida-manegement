class Attendance < ApplicationRecord

  belongs_to :user
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :arrive

  with_options presence: true do
    validates :arrive_id, :attendance_day, :flying_id
    validates :arrive_id, numericality: { other_than: 1 } 

    with_options format: { with: /\A[-]?[0-9]+(\.[0-9]+)?{1,3}\z/ } do
      validates :flying_id
    
    end
    
  end

  


 


end
