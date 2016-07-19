class Image < ActiveRecord::Base
  belongs_to :user

  validates :image_url, presence: true
  validates :user_id, presence: true, uniqueness: true
end
