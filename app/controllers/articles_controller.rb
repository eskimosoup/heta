class ArticlesController < ApplicationController

  before_filter {@current_branch = Willow::StaticPage.find_by_name('News').branch}

  def index
    @articles = Article.where("display = ? and date <= ?", true, Date.today).order('date desc').page(params[:page]).per(10)
  end

  def show
    @article = Article.where(display: true).find(params[:id])
    @articles = Article.where("display = ? and date <= ?", true, Date.today).order('date desc').limit(5)
    @current_article = @article if @article
  end

end

