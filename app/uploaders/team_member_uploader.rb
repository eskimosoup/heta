class TeamMemberUploader < Chronicler::ImageUploader

  version :small do
    process :resize_to_fill => [260, 170]
  end

  version :show do
    process :resize_to_fit => [288, 427]
  end

end
