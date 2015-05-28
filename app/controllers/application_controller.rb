class ApplicationController < ActionController::Base

  before_filter :set_seo_variables

  def sitemap
    @seo_entries = SeoEntry.where(:in_sitemap => true).order(:nominal_url)

    respond_to do |format|
      format.html
      format.xml
    end
  end

  def set_seo_variables
    seo_entry = SeoEntry.find_by_nominal_url(request.path)
    if seo_entry
      @title = seo_entry.title
      @meta_description = seo_entry.meta_description
      @meta_tags = seo_entry.title
    else
      @meta_description = SITE_SETTINGS['Default Meta Description']
      @meta_tags = SITE_SETTINGS['Default Meta Tags']
    end
  end

  protect_from_forgery

  before_filter :navigation_and_footer_content

  def index
    @banners             = Banner.where(:display => true).order(:position)
    @companies           = Company.where(:display => true).order(:position)
    @apprentices         = Apprentice.where(:display => true).where(:highlight => true).order(:position)
    @articles            = Article.where("display = ? and date <= ?", true, Date.today).limit(4).order('date desc')
    @course_categories   = CourseCategory.all
    @home_promotions     = HomePromotion.where(display: true).order(:position).limit(4)

    @current_branch = Willow::StaticPage.find_by_name('Home').branch
  end

  private

  def navigation_and_footer_content
    @navigation = Willow::Branch.includes(:leaf).where(:tree => "Main Navigation").roots.order(:position)
    @footer_icons = FooterIcon.where(:display => true).order(:position).limit(10)
    @apply_now = DisplayToggle.where(display: true).first
  end


end
