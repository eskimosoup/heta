class HomePromotion < ActiveRecord::Base
  validates :title, :link, presence: true
end
