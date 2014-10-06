class FooterIconUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end

  process :resize_to_limit => [1024, 1024]
  process :convert_problem_formats
  process :convert_to_grayscale

  version :thumb do
    process :resize_and_pad => [171, 80]
  end

  def extension_white_list
    self.class.extension_white_list
  end

  def self.extension_white_list
    %w(jpg jpeg jpe png gif bmp)
  end

  def convert_problem_formats
    manipulate! do |img|
      if File.extname(img.path) == '.gif'
        img.format('png')
      elsif File.extname(img.path) == '.bmp'
        img.format('jpg')
      end
      img = yield(img) if block_given?
      img
    end
  end

  def convert_to_grayscale
    manipulate! do |img|
      img.colorspace('Gray')
      img = yield(img) if block_given?
      img
    end
  end

  def filename
    if !super.blank?
      if File.extname(super) == '.gif'
        super.chomp(File.extname(super)) + '.png'
      elsif File.extname(super) == '.bmp'
        super.chomp(File.extname(super)) + '.jpg'
      else
        super
      end
    else
      super
    end
  end

end
