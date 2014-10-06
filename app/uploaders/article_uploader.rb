class ArticleUploader < Chronicler::ImageUploader

  version :small do
    process :resize_to_fill => [260, 170]
  end

  version :show do
    process :resize_to_fit => [920, 600]
  end

end
