class Media < ActiveRecord::Base
  validates :fukuro_id, presence: true
  validates :content_hash, presence: true

  belongs_to :fukuro
  has_one :thumbnail
end
