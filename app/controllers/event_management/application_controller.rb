class EventManagement::ApplicationController < ApplicationController
  layout "event_management/layout"

  include EventManagement::Authenticatable

  before_action :confirm_signed_in

  private

  def confirm_signed_in
    if action_name == "sign_out"
      return
    elsif controller_path == "event_management/users" || controller_path == "event_management/user_sessions"
      redirect_to event_management_events_path if signed_in?
    else
      redirect_to event_management_sign_in_path unless signed_in?
    end
  end
end
