require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.storage = :cloudinary
  config.cloudinary_credentials = {
    cloud_name: ENV['CLOUDINARY_CLOUD_NAME'],
    api_key:    ENV['CLOUDINARY_API_KEY'],
    api_secret: ENV['CLOUDINARY_API_SECRET'],
    secure: true
  }

  # Dossier par défaut pour le stockage des fichiers
  config.cache_dir = "#{Rails.root}/tmp/uploads" # Pour éviter les problèmes sur Heroku avec le filesystem
  config.asset_host = ENV['CLOUDINARY_URL'] if ENV['CLOUDINARY_URL']
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
