module UsersHelper
  def userfinmap
    User.find(@event.attendances.map(&:user_id))
  end
end
