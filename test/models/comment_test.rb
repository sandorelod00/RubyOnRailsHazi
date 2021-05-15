require "test_helper"

class CommentTest < ActiveSupport::TestCase
   test "the truth" do
    assert true
   end

   test "save comment" do
     c = Comment.new createdByUserId: 1, toUserId: 2, content: "YEAA"
     assert c.save
   end
end
