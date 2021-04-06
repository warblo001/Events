module EventsHelper
  def link_toattend
    link_to 'Attend', root_path, class: 'button is-primary is-large is-fullwidth', notice: 'Thank you'
  end

  def link_toevent
    link_to 'Back to Event', root_path, class: 'button is-fullwidth'
  end

  def linkto_event(event)
    link_to event.name, event_path(event), class: 'card-header-title is-centered'
  end

  def link_back
    link_to 'Back to Event', event_path(id: params[:event_id]), class: 'button is-fullwidth'
  end

  def event_trunc(event)
    event.description.truncate_words(18)
  end

  def upcomingev
    @user.attended_events.where('date >= ?', Date.today)
  end

  def attevents
    @user.attended_events.where('date < ?', Date.today)
  end
end
