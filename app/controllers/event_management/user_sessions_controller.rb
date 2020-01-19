class EventManagement::UserSessionsController < EventManagement::ApplicationController
  def new
    @event_management_user = ::EventManagement::User.new
  end

  def create
    if sign_in(user_sessions_params)
      redirect_to event_management_events_path
    else
      @event_management_user = ::EventManagement::User.new
      flash.now[:notice] = "メールアドレスまたはパスワードに誤りがあります"
      render :new, status: 400
    end
  end

  def sign_out
    sign_out!
    flash[:notice] = "ログアウトしました"
    redirect_to event_management_sign_in_path
  end


  private

  def user_sessions_params
    params.require(:user).permit(:email, :password)
  end
end
