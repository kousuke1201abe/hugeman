class EventManagement::EventsController < EventManagement::ApplicationController
  def new
    @event_management_events = EventManagement::Event.new
  end

  def index
  end

  def show
    @event_management_event = EventManagement::Event.find(params[:id])
  end

end
