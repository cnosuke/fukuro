class Fukuro < ActiveRecord::Base
  validates :user_id, presence: true
  validates :title, presence: true
  validates :salt, presence: true
  validates :title_hash, presence: true

  belongs_to :user
  has_many :medias
end
