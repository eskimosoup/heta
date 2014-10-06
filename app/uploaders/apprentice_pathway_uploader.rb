class ApprenticePathwayUploader < Chronicler::ImageUploader

  version :small do
    process :resize_to_fill => [300, 250]
  end

  version :show do
    process :resize_to_fit => [1920, 1920]
  end

end
