require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  # config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY'],
    aws_secret_access_key: ENV['AWS_SECRET_KEY'],
    region: 'us-east-1'
  }
  config.fog_directory = ENV['AWS_BUCKET']

  # store files locally in test and development environments
  # if Rails.env.test? || Rails.env.development?
  #   config.storage = :file
  #   config.enable_processing = false
  #   config.root = "#{Rails.root}/tmp"
  # else
  #   config.storage = :fog
  # end
end
