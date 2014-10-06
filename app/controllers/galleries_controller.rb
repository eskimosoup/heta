class GalleriesController < ApplicationController


  def index
    @galleries = Gallery.where(display: true)
    @current_branch = Willow::StaticPage.find_by_name('Gallery').branch
  end


  def show
    @gallery = Gallery.where(display: true).find(params[:id])
    render layout: false
  end

end

