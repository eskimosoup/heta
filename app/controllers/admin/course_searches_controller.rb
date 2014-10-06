module Admin
  class CourseSearchesController < Manticore::ApplicationController
  
    def index
      @course_searches = CourseSearch.order('created_at desc').page(params[:page]).per(10)
    end
    
    def destroy
      @course_search = CourseSearch.find(params[:id])
      @course_search.destroy
      redirect_to admin_course_searches_path, :notice => "Course search destroyed."
    end
    
  end
end
