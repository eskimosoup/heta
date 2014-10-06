module Admin
  class ApprenticesController < Manticore::ApplicationController

    edit_images_for Apprentice, [:image]

    def index
      @apprentices = Apprentice.order(:position)
    end
    
    def new
      @apprentice = Apprentice.new
    end
    
    def create
      @apprentice = Apprentice.new(params[:apprentice])
      if @apprentice.save
        redirect_to admin_apprentices_path, :notice => "Apprentice successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @apprentice = Apprentice.find(params[:id])
    end
    
    def update
      @apprentice = Apprentice.find(params[:id])
      if @apprentice.update_attributes(params[:apprentice])
        redirect_to admin_apprentices_path, :notice => "Apprentice successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @apprentice = Apprentice.find(params[:id])
      @apprentice.destroy
      redirect_to admin_apprentices_path, :notice => "Apprentice destroyed."
    end
    
  end
end
