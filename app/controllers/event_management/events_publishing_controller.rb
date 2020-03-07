class EventManagement::EventsPublishingController < EventManagement::ApplicationController
  def create

  end

  private

  def create_params
    params.require(:event).permit{
      :id
    }
  end
end
