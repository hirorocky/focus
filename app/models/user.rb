# frozen_string_literal: true

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
    email.downcase!
  end

  def modify_black_name
    self.name = '名無し' if name.blank?
  end

  def todays_emotions(today: Time.zone.today, limit: 4)
    emotions = self.emotions
    pick_size = emotions.length <= limit ? emotions.length : limit
    emotions.sample(pick_size, random: Random.new(today.to_time.to_i))
  end

  def recent_emotions(limit: 2)
    emotions.where('created_at >= ?', half_of_years).sample(limit)
  end

  def previous_emotions(limit: 2)
    emotions.where('created_at <= ?', half_of_years).sample(limit)
  end

  def positive_emotions(limit: 2)
    result = nil
    emotions.find_each do |emotion|
      if emotion.emotion_score > 0.1
        result ||= []
        result << emotion
      end
    end
    result.present? ? result.sample(limit) : nil
  end

  def negative_emotions(limit: 2)
    result = nil
    emotions.find_each do |emotion|
      if emotion.emotion_score < -0.1
        result ||= []
        result << emotion
      end
    end
    result.present? ? result.sample(limit) : nil
  end

  private

  def half_of_years
    sorted = emotions.order(created_at: :asc)
    oldest = sorted.first.created_at
    latest = sorted.last.created_at

    oldest + (latest - oldest) / 2
  end
end
