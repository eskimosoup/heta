module Admin
  class CourseInstancesController < Manticore::ApplicationController
  
    def index
      @course_instances = CourseInstance.order('start_date desc').page(params[:page]).per(10)
    end
    
    def new
      @course_instance = CourseInstance.new
    end
    
    def create
      @course_instance = CourseInstance.new(params[:course_instance])
      if @course_instance.save
        redirect_to admin_course_instances_path, :notice => "Course instance successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @course_instance = CourseInstance.find(params[:id])
    end
    
    def update
      @course_instance = CourseInstance.find(params[:id])
      if @course_instance.update_attributes(params[:course_instance])
        redirect_to admin_course_instances_path, :notice => "Course instance successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @course_instance = CourseInstance.find(params[:id])
      @course_instance.destroy
      redirect_to admin_course_instances_path, :notice => "Course instance destroyed."
    end
    
  end
end
