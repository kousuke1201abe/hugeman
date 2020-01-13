class EventManagement::EventsController < EventManagement::ApplicationController
  def index
    @event_management_event = EventManagement::Event.all
  end

  def show
    @event_management_event = EventManagement::Event.find(params[:id])
  end

end
