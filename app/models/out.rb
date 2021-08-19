class Out < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :off

  with_options presence: true do
    validates :off_id, :out_day
    validates :off_id, numericality: { other_than: 1 } 
  end


end
