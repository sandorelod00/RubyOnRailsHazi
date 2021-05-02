class CreateProjectStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :project_statuses do |t|
      t.string :projectStatus

      t.timestamps
    end
  end
end
