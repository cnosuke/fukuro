class User < ActiveRecord::Base
  validates :uuid, presence: true
  has_many :fukuros

  def self.create_with_uuid(opt = {})
    opt.reverse_merge!(uuid: SecureRandom.uuid)
    create(opt)
  end
end
