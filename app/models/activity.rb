class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :user_challenge, optional: true
end
