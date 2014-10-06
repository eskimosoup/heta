module Admin
  class CoursesController < Manticore::ApplicationController
  
    def index
      @courses = Course.page(params[:page]).per(10)
    end
    
    def new
      @course = Course.new
    end
    
    def create
      @course = Course.new(params[:course])
      if @course.save
        redirect_to admin_courses_path, :notice => "Course successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @course = Course.find(params[:id])
    end
    
    def update
      @course = Course.find(params[:id])
      if @course.update_attributes(params[:course])
        redirect_to admin_courses_path, :notice => "Course successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @course = Course.find(params[:id])
      @course.destroy
      redirect_to admin_courses_path, :notice => "Course destroyed."
    end
    
  end
end
