class Rest < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :holiday

  with_options presence: true do
    validates :holiday_id, :rest_day
    validates :holiday_id, numericality: { other_than: 1 } 
  end

end
