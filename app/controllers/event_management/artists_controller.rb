class EventManagement::ArtistsController < EventManagement::ApplicationController

  def new
  end

  def create
      event_management_artist = EventManagement::Artist.create!(artist_params)
      redirect_to event_management_events_path, notice: "出演者が登録されました"
    rescue ActiveRecord::RecordInvalid => e
      render :new, status: 400
  end


  private

  def nightclub_params
    params.require(:nightclub).permit(:name)
  end

end
