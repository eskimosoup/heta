class CoursesController < ApplicationController

  before_filter :current_branch

  def current_branch
    @current_branch = Willow::StaticPage.find_by_name('Trade Courses').try(:branch)
  end

  def index
    @search = CourseSearch.new
    @courses = Course.where(:display => true).search(params[:search]).order(:name)
    @bookable_courses = Course.where(:course_type => "Bookable", :display => true)
    @ondemand_courses = Course.where(:course_type => "On Demand", :display => true)
    
    @all_courses = Course.where(:display => true).order(:name)
  end

  def course_calendar
    @course_instances = CourseInstance.all
  end

  def show
    @course = Course.find(params[:id])
    @course_instances = @course.course_instances.where("end_date >= ? and display = ?", Date.today, true)
    @selected_instance = @course_instances.first
  end

end

