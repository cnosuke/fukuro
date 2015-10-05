class V1::MediaController < ApplicationController

  def show
  end

  def create
    @fukuro = Fukuro.find(medium_params[:fukuro_id])

    if @fukuro.owned_by?(current_user)
      @medium = Medium.setup(fukuro: @fukuro, file: medium_params[:file])
      if @medium.save
        res(results: {
            medium: @medium.to_h,
            fukuro: @fukuro.to_h,
          })
      else
        res(status: 500)
      end
    else
      res(status: 403, message: 'You are not the owner of Fukuro')
    end
  end

  private

  def medium_params
    prms = params.
      permit(:fukuro_id, :file)
    prms.merge(user: current_user)
  end
end
