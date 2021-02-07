class Clan < ApplicationRecord
  validates_presence_of :name
  has_many :users
  # belongs_to :user
  belongs_to :owner, :foreign_key => 'user_id', class_name: "User"
end
