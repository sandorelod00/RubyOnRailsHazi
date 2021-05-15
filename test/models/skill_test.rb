require "test_helper"

class SkillTest < ActiveSupport::TestCase
   test "the truth" do
    assert true
   end

   test "add new skill" do
     s = Skill.new skillName: "Talking"
     assert s.save
   end
end
