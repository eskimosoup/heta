class DisplayToggle < ActiveRecord::Base
  validates :name, :url, presence: true
end
