class EventManagement::NightclubsController < EventManagement::ApplicationController

  def new
    
  end

  def create
    begin
      event_management_nightclub = EventManagement::Nightclub.create!(nightclub_params)
    rescue ActiveRecord::RecordInvalid => e
      render new_event_management_nightclub_path, status: 400
    end
  end


  private

  def nightclub_params
    params.require(:nightclub).permit(:name)
  end
end
