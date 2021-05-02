json.extract! project, :id, :name, :description, :team_id, :project_status_id, :due_date, :created_at, :updated_at
json.url project_url(project, format: :json)
