class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process :convert => 'jpg'
  process :tags => ['event_photo']

  version :thumbnail do
    process resize_to_fit: [150, 150]
  end

  def public_id
    return "events/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
