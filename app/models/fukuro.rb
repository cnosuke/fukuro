class Fukuro < ActiveRecord::Base
  validates :user_id, presence: true
  validates :title, presence: true

  belongs_to :user
  has_many :media, through: FukuroMedia

  def to_h
    {
      title: title,
    }
  end
end
