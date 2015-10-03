class Fukuro < ActiveRecord::Base
  validates :user_id, presence: true
  validates :title, presence: true

  belongs_to :user
  has_many :media

  def to_json_response
    {
      title: title
    }
  end
end
