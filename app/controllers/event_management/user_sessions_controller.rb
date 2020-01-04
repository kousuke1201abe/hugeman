class EventManagement::UserSessionsController < EventManagement::ApplicationController
  def new
    @event_management_user = ::EventManagement::User.new
  end

  def create
    if sign_in(user_sessions_params)
      # TODO: リダイレクト先を指定
    else
      @event_management_user = ::EventManagement::User.new
      flash.now[:notice] = "メールアドレスまたはパスワードに誤りがあります"
      render :new
    end
  end

  private

  def user_sessions_params
    params.require(:user).permit(:email, :password)
  end
end
