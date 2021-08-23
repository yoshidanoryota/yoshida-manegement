class Comment < ApplicationRecord

  belongs_to :user

  with_options presence: true do
    validates :text, :user_id
  end

end
