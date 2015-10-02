class Thumbnail < ActiveRecord::Base
  validates :media_id, presence: true
  validates :content_hash, presence: true

  belongs_to :fukuro
  has_one :thumbnail
end
