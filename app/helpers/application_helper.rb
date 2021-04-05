module ApplicationHelper
  def createv
    link_to 'Create event', new_event_path, class: 'button is-white'
  end

  def logoutme
    link_to 'Logout', logout_path, class: 'button is-white'
  end

  def signinme
    link_to 'Sign In', login_path, class: 'button is-white'
  end

  def signupme
    link_to 'Sign Up', signup_path, class: 'button is-white'
  end

  def linktocurr
    link_to current_user.username, user_path(current_user), class: 'button is-white'
  end

  def linktoroot
    link_to 'Private Events', root_path, class: 'navbar-item'
  end

  def flasha
    flash[:alert]
  end

  def flashnot
    flash[:notice]
  end
end
