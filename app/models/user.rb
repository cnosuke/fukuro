class User < ActiveRecord::Base
  validates :uuid, presence: true
  has_many :fukuros
end
