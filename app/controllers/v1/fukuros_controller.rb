class V1::FukurosController < ApplicationController

  def show
    @fukuro = Fukuro.active.find_by(title: params[:title])
    if @fukuro
      res(results: {
        fukuto: @fukuro.to_h,
        media: @fukuro.media.map(&:to_h),
        })
    else
      res(status: 404, message: 'Fukuro not found.')
    end
  end

  def create
    @fukuro = Fukuro.new(fukuro_params)

    if @fukuro.save
      res(results: @fukuro)
    else
      res(status: 500)
    end
  end

  private

  def fukuro_params
    prms = params.
      permit(:title, :expired_at)
    prms.merge(user: current_user)
  end
end
