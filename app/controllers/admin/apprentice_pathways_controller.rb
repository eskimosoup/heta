module Admin
  class ApprenticePathwaysController < Manticore::ApplicationController

    edit_images_for ApprenticePathway, [:image]
  
    def index
      @apprentice_pathways = ApprenticePathway.all
    end
    
    def new
      @apprentice_pathway = ApprenticePathway.new
    end
    
    def create
      @apprentice_pathway = ApprenticePathway.new(params[:apprentice_pathway])
      if @apprentice_pathway.save
        redirect_to admin_apprentice_pathways_path, :notice => "Apprentice pathway successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @apprentice_pathway = ApprenticePathway.find(params[:id])
    end
    
    def update
      @apprentice_pathway = ApprenticePathway.find(params[:id])
      if @apprentice_pathway.update_attributes(params[:apprentice_pathway])
        redirect_to admin_apprentice_pathways_path, :notice => "Apprentice pathway successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @apprentice_pathway = ApprenticePathway.find(params[:id])
      @apprentice_pathway.destroy
      redirect_to admin_apprentice_pathways_path, :notice => "Apprentice pathway destroyed."
    end
    
  end
end
