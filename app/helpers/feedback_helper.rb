module FeedbackHelper
  @toUserID
  def set_toUserId(toUserId)
    @toUserID = toUserId
  end

  def getToUserId
    return @toUserID
  end
end
