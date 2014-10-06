module Admin
  class AvailableApprenticesController < Manticore::ApplicationController

    edit_images_for Apprentice, [:image]

    def index
      @available_apprentices = AvailableApprentice.all
    end
    
    def new
      @available_apprentice = AvailableApprentice.new
    end
    
    def create
      @available_apprentice = AvailableApprentice.new(params[:available_apprentice])
      if @available_apprentice.save
        redirect_to admin_available_apprentices_path, :notice => "Available apprentice successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @available_apprentice = AvailableApprentice.find(params[:id])
    end
    
    def update
      @available_apprentice = AvailableApprentice.find(params[:id])
      if @available_apprentice.update_attributes(params[:available_apprentice])
        redirect_to admin_available_apprentices_path, :notice => "Available apprentice successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @available_apprentice = AvailableApprentice.find(params[:id])
      @available_apprentice.destroy
      redirect_to admin_available_apprentices_path, :notice => "Available apprentice destroyed."
    end
    
  end
end
