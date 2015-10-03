class V1::FukurosController < ApplicationController

  def show
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
      permit(:title)
    prms.merge(user: current_user)
  end
end
