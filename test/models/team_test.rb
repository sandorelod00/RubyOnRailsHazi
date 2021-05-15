require "test_helper"

class TeamTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

   test "Can save team " do
     t = Team.new name: 'TestToSave'
     assert t.save, "cannot save"
   end
end
