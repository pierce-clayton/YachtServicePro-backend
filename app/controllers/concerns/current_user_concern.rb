module CurrentUserConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_curent_user
  end

  def set_curent_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end
end