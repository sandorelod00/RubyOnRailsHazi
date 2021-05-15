require "test_helper"

class ProjectTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

   test "save new project" do
     p = Project.new name: "Test", description: "asdf", team_id: 2, project_status_id: 3
     assert p.save
   end
end
