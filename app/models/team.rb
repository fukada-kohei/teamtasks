class Team < ApplicationRecord
  validates :team_name, presence: true, length: { maximum:50 }
  
  has_many :tasks
  has_many :relationships
  has_many :members, through: :relationships, source: :user
end
