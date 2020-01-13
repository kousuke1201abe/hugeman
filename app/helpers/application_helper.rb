module ApplicationHelper
  def signed_in?
    @current_user.present?
  end
end
