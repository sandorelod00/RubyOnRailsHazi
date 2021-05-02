class CreateTeamMemberRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :team_member_relations do |t|

      t.timestamps
    end
  end
end
