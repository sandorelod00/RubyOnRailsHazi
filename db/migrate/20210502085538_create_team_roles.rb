class CreateTeamRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :team_roles do |t|
      t.string :roleTitle

      t.timestamps
    end
  end
end
