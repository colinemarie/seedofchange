class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :user_challenge
end
