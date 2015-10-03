class V1::UsersController < ApplicationController
  skip_before_filter :check_account, only: %i(create)

  def create
    user = User.create_with_uuid
    res status: 200, results: {uuid: user.uuid}
  end

  def show
    r = {
      fukuros: current_user.fukuros.map(&:to_h)
    }

    res status: 200, results: r
  end
end
