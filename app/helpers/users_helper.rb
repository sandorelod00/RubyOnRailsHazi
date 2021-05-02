module UsersHelper
  def isOwnerOfPage?(paramId)
    if   paramId.to_i == session[:user]
      return true
    else
      return false
    end
  end
end
