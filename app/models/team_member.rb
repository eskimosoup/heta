class TeamMember < ActiveRecord::Base
  #attr_accessible :content, :image, :job_title, :name, :position, :summary
  validates :name, :job_title, :summary, :content, :image, :image, presence: true
  mount_uploader :image, TeamMemberUploader
end
