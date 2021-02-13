class User < ApplicationRecord
  has_many :user_challenges, dependent: :destroy
  has_many :challenges, through: :user_challenges
  belongs_to :clan, optional: true
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
