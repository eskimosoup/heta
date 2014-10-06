class PageImageUploader < Chronicler::ImageUploader

  version :show do
    process :resize_to_fit => [400, 1000]
  end

end
