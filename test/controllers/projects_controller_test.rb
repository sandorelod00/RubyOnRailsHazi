require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end


  test "should create project" do
    assert_difference('Project.count') do
      post projects_url, params: { project: { description: @project.description, due_date: @project.due_date, name: @project.name, project_status_id: @project.project_status_id, team_id: @project.team_id } }
    end

    assert_redirected_to project_url(Project.last)
  end


  test "should update project" do
    patch project_url(@project), params: { project: { description: @project.description, due_date: @project.due_date, name: @project.name, project_status_id: @project.project_status_id, team_id: @project.team_id } }
    assert_redirected_to project_url(@project)
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end
end
