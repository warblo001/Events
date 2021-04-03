module EventsHelper
  def link_toattend
    link_to 'Attend', root_path, class: 'button is-primary is-large is-fullwidth', notice: 'Thank you'
  end

  def link_toevent
    link_to 'Back to Event', root_path
  end

  def link_back
    link_to 'Back to Event', event_path(id: params[:event_id]), class: 'button is-fullwidth'
  end
end
