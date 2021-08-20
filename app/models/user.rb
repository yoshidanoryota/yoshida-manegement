class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :attendances
has_many :outs
has_many :comments



  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :division
  belongs_to :office

  with_options presence: true do
    validates :number, :division_id, :office_id

    validates :division_id, :office_id, numericality: { other_than: 1 } 

    validates :number,numericality: {only_integer: true}, length: { in: 6..6 }

    with_options format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ } do
      validates :password

    end

    
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
      validates :name

    end
    
  end



  
end
