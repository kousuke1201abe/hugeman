class EventManagement::NightclubsController < EventManagement::ApplicationController
  def index
  end

  def show
    @event_management_event = EventManagement::Nightclubs.find(params[:id])
  end

  def new
  
  end

  def create
  
  end

end
