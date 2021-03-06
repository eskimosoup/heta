module Admin
  class GalleriesController < Manticore::ApplicationController

    edit_images_for Gallery, [:image]
  
    def index
      @galleries = Gallery.order(:position)
    end
    
    def new
      @gallery = Gallery.new
    end
    
    def create
      @gallery = Gallery.new(params[:gallery])
      if @gallery.save
        redirect_to admin_galleries_path, :notice => "Gallery successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @gallery = Gallery.find(params[:id])
    end
    
    def update
      @gallery = Gallery.find(params[:id])
      if @gallery.update_attributes(params[:gallery])
        redirect_to admin_galleries_path, :notice => "Gallery successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @gallery = Gallery.find(params[:id])
      @gallery.destroy
      redirect_to admin_galleries_path, :notice => "Gallery destroyed."
    end
    
  end
end
