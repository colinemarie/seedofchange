class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_challenges, dependent: :destroy
  has_many :challenges, through: :user_challenges
  has_many :activities, dependent: :destroy
  has_many :invitations, dependent: :destroy
  belongs_to :clan, optional: true
  has_one_attached :photo
  validates :first_name, :username, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
end
