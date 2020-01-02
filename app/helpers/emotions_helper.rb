# frozen_string_literal: true

module EmotionsHelper
  def color_divider(color: '#000000', on_black: 'white', on_white: 'black')
    rgb = color.scan(/\w\w/).map(&:hex)
    brightness = rgb.inject(&:+) / 3
    if brightness > 127
      on_white
    else
      on_black
    end
  end

  def emotion_text_color(color)
    color_divider(color: color)
  end

  def emotion_text_color_class(color)
    color_divider(color: color,
                  on_black: 'has-text-white', on_white: 'has-text-black')
  end
end
