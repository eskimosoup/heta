class AvailableApprentice < ActiveRecord::Base
  mount_uploader :image, AvailableApprenticeUploader

  belongs_to :training_location

  scope :by_location,
        lambda { |location| {
            :conditions => ["training_location_id LIKE ?", "#{location}%"]
        }}
end
