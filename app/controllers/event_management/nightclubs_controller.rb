class EventManagement::NightclubsController < EventManagement::ApplicationController

  def new
    
  end

  def create
      event_management_nightclub = EventManagement::Nightclub.create!(nightclub_params)
      render new_event_management_artist_path, notice: "会場名が登録されました"
    rescue ActiveRecord::RecordInvalid => e
      render :new, status: 400
  end


  private

  def nightclub_params
    params.require(:nightclub).permit(:name)
  end
end
