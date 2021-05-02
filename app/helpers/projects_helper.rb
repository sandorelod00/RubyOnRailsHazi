module ProjectsHelper
  def isOwner?(teamRoles)
    if teamRoles[session[:user]] == "Owner"
      return true
    end
    return false
  end
end
