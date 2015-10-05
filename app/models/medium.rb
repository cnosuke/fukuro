class Medium < ActiveRecord::Base
  validates :content_hash, presence: true

  has_many :fukuro_media
  has_many :fukuros, through: :fukuro_media
  has_one :thumbnail

  scope :by_hash, -> (str) { where(content_hash: str) }

  def self.find_by_file(f)
    by_hash(digest(f)).first
  end

  def self.setup!(fukuro: nil, file: nil)
    raise ArgumentError unless fukuro && file

    obj = self.find_by_file(file) || new(content_hash: digest(file))
    obj.fukuros << fukuro unless obj.fukuros.include?(fukuro)

    if obj.new_record?
      obj.save
      obj.save_file!(file)
    end

    obj
  end

  def self.digest(f)
    body = f.read
    f.rewind
    Digest::SHA2.hexdigest(body)
  end

  def to_h
    {
      content_hash: content_hash,
    }
  end

  def save_file!(file)
    open(save_location, 'w'){|f| f.write file.read }
    file.rewind
  end

  def save_location
    if Rails.env.development?
      prefix = "#{Rails.root}/tmp/data"
      FileUtils.mkdir_p(prefix)
      "#{prefix}/#{content_hash}"
    else
      # not implemented
    end
  end
end
