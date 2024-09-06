class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process convert: 'jpg'
  process tags: ['event_photo']

  version :thumbnail do
    process resize_to_fit: [150, 150]
  end
end
