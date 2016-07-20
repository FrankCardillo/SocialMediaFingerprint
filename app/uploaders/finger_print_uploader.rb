# encoding: utf-8

class FingerPrintUploader < CarrierWave::Uploader::Base
  def extension_whitelist
    %w( png )
  end

  if Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
