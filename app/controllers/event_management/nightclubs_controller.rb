class EventManagement::NightclubsController < EventManagement::ApplicationController

  def new
    
  end

  def create
    event_management_nightclub = EventManagement::Nightclub.create!(nightclub_params)
    if event_management_nightclub == false
      redirect_to :new_event_management_nightclub_path
    end
  end


  private

  def nightclub_params
    params.require(:nightclub).permit(:name)
  end
end
