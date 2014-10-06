class ApprenticePathwaysController < ApplicationController

  def index
    @apprentice_pathways = ApprenticePathway.where(:display => true)
  end

  def show
    @apprentice_pathway = ApprenticePathway.find(params[:id])
    @current_branch = Willow::StaticPage.find_by_name('Apprentice Pathways').try(:branch)
    @root_branch = @current_branch.root if @current_branch
    @latest_news = Article.where("display = ? and date <= ?", true, Date.today).order('date desc').limit(5)
  end

end

