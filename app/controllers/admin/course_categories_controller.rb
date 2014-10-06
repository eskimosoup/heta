module Admin
  class CourseCategoriesController < Manticore::ApplicationController
  
    def index
      @course_categories = CourseCategory.all
    end
    
    def new
      @course_category = CourseCategory.new
    end
    
    def create
      @course_category = CourseCategory.new(params[:course_category])
      if @course_category.save
        redirect_to admin_course_categories_path, :notice => "Course category successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @course_category = CourseCategory.find(params[:id])
    end
    
    def update
      @course_category = CourseCategory.find(params[:id])
      if @course_category.update_attributes(params[:course_category])
        redirect_to admin_course_categories_path, :notice => "Course category successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @course_category = CourseCategory.find(params[:id])
      @course_category.destroy
      redirect_to admin_course_categories_path, :notice => "Course category destroyed."
    end
    
  end
end
