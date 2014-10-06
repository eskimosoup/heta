class Course < ActiveRecord::Base

  has_many :course_instances, :order => "start_date asc", :conditions => ["start_date >= ?", Date.today], dependent: :destroy
  belongs_to :course_category

  extend FriendlyId
  friendly_id :name, :use => :slugged

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      where(true)
    end
  end

end
