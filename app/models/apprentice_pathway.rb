class ApprenticePathway < ActiveRecord::Base

  mount_uploader :image, ApprenticePathwayUploader

  has_many :apprentices

  extend FriendlyId
  friendly_id :title, :use => :slugged
end
