# frozen_string_literal: true

class Emotion < ApplicationRecord
  before_save :upcase_color
  belongs_to :user
  has_many :fragments, dependent: :destroy
  has_many :tags, through: :fragments

  validates :name, presence: true, length: { maximum: 30 }
  validates :color, presence: true, format: { with: /\A#[a-f\d]{6}/i }

  def emotion_score
    scores = fragments.pluck(:score)
    if scores.present?
      scores.sum / scores.size
    else
      0
    end
  end

  def upcase_color
    color.upcase!
  end

  def created_at_with_format
    created_at.strftime('%Y/%m/%d %H:%M:%S')
  end

  def fragments_tag_content_pairs
    fragments = self.fragments
    result = []
    fragments.each do |fragment|
      tag_name = tags.find(fragment.tag_id).name
      content = fragment.content
      result << { tag: tag_name, content: content }
    end
    result
  end
end
