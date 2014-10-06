class TrainingLocation < ActiveRecord::Base

  has_many :course_instances
  has_many :available_apprentices

  geocoded_by :postcode
  after_validation :geocode, :if => :postcode_changed?
end
