class CourseCategory < ActiveRecord::Base
  attr_accessible :colour, :title

  belongs_to :course
end
