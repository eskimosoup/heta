class CourseInstancesController < ApplicationController

  def show
    @current_branch = Willow::StaticPage.find_by_name('Trade Courses').try(:branch)
    @course_instance = CourseInstance.where("end_date >= ? and display = ?", Date.today, true).find(params[:id])
    @course_instances = CourseInstance.where("end_date >= ? and course_id = ? and display = ?", Date.today, @course_instance.course_id, true)
  end

end

