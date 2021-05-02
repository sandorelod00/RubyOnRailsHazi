class AddTeamMemberRelation < ActiveRecord::Migration[6.1]
  def change
    add_reference :team_member_relations, :user, null:false, foreign_key: true #,
    add_reference :team_member_relations, :team, null:false, foreign_key: true #,
    add_reference :team_member_relations, :team_role, null:true , foreign_keys: true #,
  end
end
