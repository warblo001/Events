class AttendanceController < ApplicationController
  before_action :require_login

  def new
  end

  def create
    event = Event.find(params[:event_id])
    attendance = Attendance.new(event_id: event.id, user_id: params[:user_id])

    if attendance.save
      attendance.invited!
      flash[:notice] = "Invitation sent!"
      redirect_to users_path(event_id: event.id)
    else
      flash[:alert] = 'Invitation could not be sent'
      redirect_to event_path(event)
    end
  end

  def destroy
    event = Event.find(params[:event_id])
    attendance = Attendance.find(params[:id])
    if current_user == event.creator
      attendance.destroy
      flash[:notice] = "Invitation cancelled!"
    else
      attendance.invited!
      flash[:notice] = "You're not longer assisting #{event.name}!"
    end

    redirect_to users_path(event_id: event.id, id: enrollment.id)
  end

  def update
    @event = Event.find(params[:event_id])
    @attendance = Attendance.find_by(event_id: params[:event_id], user_id: current_user.id)
    if @attendance && @attendance.invited?
      @attendance.accepted!
      flash[:notice] = "Thank you for signing up for '#{@event.name}'!"
    else
      flash[:alert] = 'Your name is not on the invitation list'
    end

    redirect_to event_path(@event)
  end
end
