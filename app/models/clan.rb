class Clan < ApplicationRecord
  validates_presence_of :name
  has_many :users, dependent: :nullify
  has_many :user_challenges, through: :users
  has_many :invitations, dependent: :destroy
end
