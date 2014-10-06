class ApprenticeUploader < Chronicler::ImageUploader

  version :home do
    process :resize_to_fill => [200, 200]
  end

  version :mobile_show do
    process :resize_to_fill => [350, 180]
  end

  version :show do
    process :resize_to_fill => [476, 600]
  end

end
