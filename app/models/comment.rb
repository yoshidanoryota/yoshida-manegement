class Comment < ApplicationRecord

  belongs_to :user
  #belongs_to :attendance

  with_options presence: true do
    validates :text, :user_id
  end

end
