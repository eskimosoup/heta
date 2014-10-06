class AvailableApprenticesController < ApplicationController

  def index
    if params[:location]
      @available_apprentices = AvailableApprentice.by_location(params[:location])
    else
      @available_apprentices = AvailableApprentice.all
    end

    @locations = TrainingLocation.all
  end

end

