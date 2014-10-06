class CourseSearchesController < ApplicationController
  def index

  end

  def create
    @search = CourseSearch.create!(params[:course_search])
    redirect_to @search
  end

  def update
    @search = CourseSearch.create!(params[:course_search])
    redirect_to @search
  end

  def show
    @search = CourseSearch.find(params[:id])
  end

end
