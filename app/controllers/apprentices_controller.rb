class ApprenticesController < ApplicationController

  def index
    @apprentices = Apprentice.where(display: true).order(:position)
  end

  def show
    @apprentice = Apprentice.where(display: true).find(params[:id])
  end

  def apprentice_modal
    @apprentice = Apprentice.where(display: true).find(params[:id])
    render layout: false
  end
end

