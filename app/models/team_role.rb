class TeamRole < ApplicationRecord
  has_many :team_member_relations
  has_many :projects
end
