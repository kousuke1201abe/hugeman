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

  def new
  end

  def update
    @event_management_event = EventManagement::Event.find(params[:id])
    if @event_management_event.update!(event_management_event_params)
      redirect_to event_management_events_path(@event_management_event.event), notice: 'イベント情報を更新しました'
    end
  end

  private
  def event_management_event_params
    params.require(:event).permit(
      :name,
      :tag,
      :start_at,
      :end_at
    )
  end
end
