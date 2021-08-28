class Out < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :off

  with_options presence: true do
    validates :off_id, :out_day, :extra_id
    validates :off_id, numericality: { other_than: 1 } 
  end

  with_options format: { with: /\A[-]?[0-9]+(\.[0-9]+)?{1,3}\z/ } do
    validates :extra_id
  
  end

end
