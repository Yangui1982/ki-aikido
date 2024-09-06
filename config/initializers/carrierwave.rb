require 'cloudinary'
require 'cloudinary/uploader'
require 'cloudinary/utils'
require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.storage = :cloudinary
  config.cloudinary_credentials = {
    cloud_name: ENV['CLOUDINARY_CLOUD_NAME'],
    api_key:    ENV['CLOUDINARY_API_KEY'],
    api_secret: ENV['CLOUDINARY_API_SECRET'],
    secure:     true
  }

  # Utilisez un dossier temporaire spécifique à Heroku
  config.cache_dir = "#{Rails.root}/tmp/uploads" # Pour éviter les problèmes avec le système de fichiers éphémère de Heroku
end



# CarrierWave.configure do |config|
#   config.cache_storage = :file

#   if Rails.env.production? || Rails.env.staging?
#     config.storage = :cloudinary
#     config.cloudinary_credentials = {
#       cloud_name: ENV['CLOUDINARY_CLOUD_NAME'],
#       api_key:    ENV['CLOUDINARY_API_KEY'],
#       api_secret: ENV['CLOUDINARY_API_SECRET'],
#     }
#     config.asset_host = "https://res.cloudinary.com/#{ENV['CLOUDINARY_CLOUD_NAME']}"
#   else
#     config.storage = :file
#   end
# end
