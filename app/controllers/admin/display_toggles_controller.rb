module Admin
  class DisplayTogglesController < Manticore::ApplicationController
  
    def index
      @display_toggles = DisplayToggle.all
    end
    
    def new
      @display_toggle = DisplayToggle.new
    end
    
    def create
      @display_toggle = DisplayToggle.new(params[:display_toggle])
      if @display_toggle.save
        redirect_to admin_display_toggles_path, :notice => "Display toggle successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @display_toggle = DisplayToggle.find(params[:id])
    end
    
    def update
      @display_toggle = DisplayToggle.find(params[:id])
      if @display_toggle.update_attributes(params[:display_toggle])
        redirect_to admin_display_toggles_path, :notice => "Display toggle successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @display_toggle = DisplayToggle.find(params[:id])
      @display_toggle.destroy
      redirect_to admin_display_toggles_path, :notice => "Display toggle destroyed."
    end
    
  end
end
