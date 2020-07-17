class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
  has_secure_password
  has_many :relationships
  has_many :joined_teams, through: :relationships, source: :team
  
  def join(team)
    self.relationships.create(team_id: team.id)
  end
  
  def unjoin(team)
    relationship = self.relationships.find_by(team_id: team.id)
    relationship.destroy if relationship
  end
  
  def joined_team?(team)
    self.joined_teams.include?(team)
  end
end
