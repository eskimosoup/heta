class Article < ActiveRecord::Base
  mount_uploader :image, ArticleUploader

  extend FriendlyId
  friendly_id :headline, :use => :slugged
end
