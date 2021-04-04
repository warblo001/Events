module AttendancesHelper
  def attfindb
    Attendance.find_by(event_id: @event.id, user_id: current_user.id)
  end
end
