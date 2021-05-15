require "test_helper"

class ProjectStatusTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

   test "save new project status" do
     ps = ProjectStatus.new projectStatus: "Kettes?"
     assert ps.save
   end

end
