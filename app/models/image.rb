class Image < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image_url, FingerPrintUploader

  validates :image_url, format: { with: /\A(.)+[.](png)\z/ }
  validates :image_url, presence: true
  validates :user_id, presence: true, uniqueness: true
end
