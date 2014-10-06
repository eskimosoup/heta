class CourseSearch < ActiveRecord::Base
  attr_accessible :course_category_id, :course_type, :keywords

  def courses
    @courses ||= find_courses
  end

private

  def find_courses
    Course.find(:all, :conditions => conditions)
  end


  def keyword_conditions
    ["name like ? or summary like ?", "%#{keywords}%", "%#{keywords}%"] unless keywords.blank?
  end

  def course_category_conditions
    ["course_category_id = ?", course_category_id] unless course_category_id.blank?
  end

  def course_type_conditions
    ["course_type like ?", course_type] unless course_type.blank?
  end

  def conditions
    [conditions_clauses.join(' AND '), *conditions_options]
  end

  def conditions_clauses
    conditions_parts.map { |condition| condition.first }
  end

  def conditions_options
    conditions_parts.map { |condition| condition[1..-1] }.flatten
  end

  def conditions_parts
    private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
  end




end