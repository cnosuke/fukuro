module ErrorHandlers
  extend ActiveSupport::Concern

  included do
    class Forbidden < ActionController::ActionControllerError; end
    class RoutingError < ActionController::ActionControllerError; end
    class RecordNotFound < ActionController::ActionControllerError; end

    rescue_from Exception, with: :rescue500
    rescue_from ApplicationController::Forbidden, with: :rescue403
    rescue_from ActionController::RoutingError, with: :rescue404
    rescue_from ActiveRecord::RecordNotFound, with: :rescue404
  end

  private

  def rescue403(e)
    @exception = e
    render json: {status: 403, message: @exception.to_s}
  end

  def rescue404(e)
    @exception = e
    render json: {status: 404, message: @exception.to_s}
  end

  def rescue500(e)
    @exception = e
    render json: {status: 500, message: @exception.to_s}
  end
end
