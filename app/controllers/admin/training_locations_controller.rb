module Admin
  class TrainingLocationsController < Manticore::ApplicationController
  
    def index
      @training_locations = TrainingLocation.all
    end
    
    def new
      @training_location = TrainingLocation.new
    end
    
    def create
      @training_location = TrainingLocation.new(params[:training_location])
      if @training_location.save
        redirect_to admin_training_locations_path, :notice => "Training location successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @training_location = TrainingLocation.find(params[:id])
    end
    
    def update
      @training_location = TrainingLocation.find(params[:id])
      if @training_location.update_attributes(params[:training_location])
        redirect_to admin_training_locations_path, :notice => "Training location successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @training_location = TrainingLocation.find(params[:id])
      @training_location.destroy
      redirect_to admin_training_locations_path, :notice => "Training location destroyed."
    end
    
  end
end
