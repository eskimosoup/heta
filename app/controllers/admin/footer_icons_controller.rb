module Admin
  class FooterIconsController < Manticore::ApplicationController

    edit_images_for FooterIcon, [:image]

    def index
      @footer_icons = FooterIcon.order(:position)
    end
    
    def new
      @footer_icon = FooterIcon.new
    end
    
    def create
      @footer_icon = FooterIcon.new(params[:footer_icon])
      if @footer_icon.save
        redirect_to admin_footer_icons_path, :notice => "Footer icon successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @footer_icon = FooterIcon.find(params[:id])
    end
    
    def update
      @footer_icon = FooterIcon.find(params[:id])
      if @footer_icon.update_attributes(params[:footer_icon])
        redirect_to admin_footer_icons_path, :notice => "Footer icon successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @footer_icon = FooterIcon.find(params[:id])
      @footer_icon.destroy
      redirect_to admin_footer_icons_path, :notice => "Footer icon destroyed."
    end
    
  end
end
