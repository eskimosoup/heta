class GalleryUploader < Chronicler::ImageUploader

  version :small do
    process :resize_to_fill => [200, 200]
  end

  version :mobile_show do
    process :resize_to_fit => [250, 400]
  end

  version :show do
    process :resize_to_fit => [1340, 800]
  end

end
