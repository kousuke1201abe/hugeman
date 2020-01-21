class EventManagement::ArtistsController < EventManagement::ApplicationController
  def index
  end

  def show
    @event_management_event = EventManagement::Artists.find(params[:id])
  end

  def new
  
  end

  def create
  
  end

end
