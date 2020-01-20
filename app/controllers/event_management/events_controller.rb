class EventManagement::EventsController < EventManagement::ApplicationController
  def index
    @event_management_events = EventManagement::Event.filter_user_by(@current_user.id)
  end

  def show
    @event_management_event = EventManagement::Event.find(params[:id])
  end

  def edit
    @event_management_event = EventManagement::Event.find(params[:id])
  end
end
