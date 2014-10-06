class CourseInstance < ActiveRecord::Base
  belongs_to :course
  belongs_to :training_location

  extend FriendlyId
  friendly_id :course_name, :use => :slugged

  def course_name
    "#{start_date}-#{course.name}"
  end
end
