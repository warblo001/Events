module AttendancesHelper
  def attfindb
    Attendance.find_by(event_id: @event.id, user_id: current_user.id)
  end

  def userrej
    @users.reject { |user| user == Event.find(params[:event_id]).user }
  end
end
