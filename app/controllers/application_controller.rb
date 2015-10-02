class ApplicationController < ActionController::Base
  include ErrorHandlers # if Rails.env.production? or Rails.env.staging?
  protect_from_forgery with: :null_session
  before_filter :check_account

  def check_account
    raise ApplicationController::Forbidden unless current_user
  end

  def current_user
    @current_user ||= User.find_by(uuid: uuid_header)
  end

  private

  def uuid_header
    request.headers['X-FUKURO-UUID']
  end
end
