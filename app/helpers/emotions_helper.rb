# frozen_string_literal: true

module EmotionsHelper
  def emotion_text_color(color)
    brightness = color.scan(/\w\w/).map(&:hex).max
    if brightness > 127
      'black'
    else
      'white'
    end
  end

  def emotion_text_color_class(color)
    brightness = color.scan(/\w\w/).map(&:hex).max
    if brightness > 127
      'has-text-black'
    else
      'has-text-white'
    end
  end
end
