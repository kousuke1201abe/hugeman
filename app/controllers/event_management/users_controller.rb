class EventManagement::UsersController < EventManagement::ApplicationController
  def new
    @event_management_user = EventManagement::User.new
  end
end
