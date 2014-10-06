class BannerUploader < Chronicler::ImageUploader

  version :show do
    process :resize_to_fill => [960, 300]
  end

  version :mobile do
    process :resize_to_fill => [500, 500]
  end

end
