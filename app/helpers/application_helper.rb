module ApplicationHelper
  def fragment_icon
    raw '<span class="icon"><i class="fas fa-puzzle-piece"></i></span>'
  end

  def fragment_text_with_icon
    fragment_icon + raw('<strong>フラグメント</strong>')
  end

  def tag_icon
    raw '<span class="icon"><i class="fas fa-tag"></i></span>'
  end

  def tag_text_with_icon
    tag_icon + raw('<strong>タグ</strong>')
  end


end
