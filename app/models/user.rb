class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  before_save :downcase_email, :modify_black_name
  has_many :emotions, dependent: :destroy
  has_many :tags, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 200 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def downcase_email
    self.email.downcase!
  end

  def modify_black_name
    self.name = "名無し" if self.name.blank?
  end

  def todays_emotions(today=Time.zone.today)
    emotions = self.emotions
    max_pick = 4
    pick_size = emotions.length <= max_pick ? emotions.length : max_pick
    emotions.sample(pick_size, random: Random.new(today.to_time.to_i))
  end
end
