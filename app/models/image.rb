class Image < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image_url, FingerPrintUploader

  validates :image_url, format: { with: /[a-zA-Z0-9]+(.png)/ }
  validates :image_url, presence: true
  validates :user_id, presence: true, uniqueness: true
end
