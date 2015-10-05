class Medium < ActiveRecord::Base
  validates :content_hash, presence: true

  has_many :fukuro_media
  has_many :fukuros, through: :fukuro_media
  has_one :thumbnail

  scope :by_hash, -> (str) { where(content_hash: str) }

  def self.find_by_file(f)
    by_hash(digest(f.read)).first
  end

  def self.setup(fukuro: nil, file: nil)
    raise ArgumentError unless fukuro && file

    obj = self.find_by_file(file) || new(content_hash: digest(file.read))
    obj.fukuros << fukuro unless obj.fukuros.include?(fukuro)
    obj
  end

  def self.digest(s)
    Digest::SHA2.hexdigest(s)
  end

  def to_h
    {
      content_hash: content_hash,
    }
  end
end
