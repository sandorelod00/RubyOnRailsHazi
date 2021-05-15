require "test_helper"

class TeamRoleTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

   test "save team role" do
     tr = TeamRole.new roleTitle: "PO"
     assert tr.save
   end
end
