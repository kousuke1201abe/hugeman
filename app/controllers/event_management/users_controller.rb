class EventManagement::UsersController < EventManagement::ApplicationController
  def new
    @event_management_user = EventManagement::User.new
  end

  def create
    event_management_user = EventManagement::User.create!(user_params)
    redirect_to event_management_events_path
  rescue ActiveRecord::RecordInvalid
    @event_management_user = EventManagement::User.new
    render :new, status: 400
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
    )
  end
end
