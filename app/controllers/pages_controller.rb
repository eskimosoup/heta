class PagesController < ApplicationController

  def show
    @page = Page.where(:display => true).find(params[:id])
    if @page.branch
      @root_branch = @page.branch.root
      @current_branch = @page.branch
    end
    @latest_news = Article.where("display = ? and date <= ?", true, Date.today).order('date desc').limit(5)
    render :layout => @page.layout
  end

end
