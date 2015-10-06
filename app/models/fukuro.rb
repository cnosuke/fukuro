class Fukuro < ActiveRecord::Base
  validates :user_id, presence: true
  validates :title, presence: true

  belongs_to :user
  has_many :fukuro_media
  has_many :media, through: :fukuro_media

  scope :not_deleted, -> { where(deleted_at: nil) }
  scope :not_expired, -> { where('expired_at IS NULL OR expired_at > ?', Time.now) }
  scope :active, -> { not_deleted.not_expired } 

  def owned_by?(user)
    user_id == user.try(:id)
  end

  def to_h
    {
      id: id,
      title: title,
    }
  end
end
