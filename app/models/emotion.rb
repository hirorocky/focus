class Emotion < ApplicationRecord
  before_save :upcase_color

  belongs_to :user

  validates :name, presence: true, length: { maximum: 30 }
  validates :color, presence: true, format: { with: /\A#[a-f\d]{6}/i }
  validates :shape, presence: true

  def upcase_color
    self.color.upcase!
  end
end
