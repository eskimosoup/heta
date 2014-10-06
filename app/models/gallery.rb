class Gallery < ActiveRecord::Base

  mount_uploader :image, GalleryUploader
end
