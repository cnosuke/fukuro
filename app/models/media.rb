class Medium < ActiveRecord::Base
  validates :fukuro_id, presence: true
  validates :content_hash, presence: true

  has_many :fukuro_media
  has_many :fukuro, through: :fukuro_media
  has_one :thumbnail
end
