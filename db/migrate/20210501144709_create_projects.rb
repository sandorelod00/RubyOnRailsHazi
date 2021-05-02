class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :team_id
      t.integer :project_status_id
      t.datetime :due_date

      t.timestamps
    end
  end
end
