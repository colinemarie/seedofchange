class Clan < ApplicationRecord
  validates_presence_of :name
  has_many :users, dependent: :nullify
end
