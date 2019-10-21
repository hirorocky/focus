class EmotionsController < ApplicationController
  def index
    @emotions = current_user.todays_emotions
  end

  def index_all
    @emotions = current_user.emotions
    render :index
  end

  def new
    @emotion = Emotion.new
    @tags = current_user.tags
  end

  def create
    emotion = current_user.emotions.new(
      name: emotion_params[:name],
      color: emotion_params[:color],
      context: emotion_params[:context],
    )
    if emotion.valid?
      comma_fragments = emotion_params[:fragments]
      unless comma_fragments.nil?
        emotion.save!
        fragments = comma_fragments.map do |comma_fragment|
          tag, content = comma_fragment.split(',')
          content = "" if content.nil?
          {tag: tag, content: content}
        end
        # tagの新規登録（validateによりかぶらないもののみ登録）+fragment登録
        fragments.each do |fragment|
          current_user.tags.create(name: fragment[:tag])
          tag_id = current_user.tags.find_by(name: fragment[:tag]).id
          emotion.fragments.create(tag_id: tag_id, content: fragment[:content])
        end
      else
        flash[:danger] = 'フラグメント一つもがありません！'
        redirect_to new_emotion_url and return
      end
    else
      flash[:danger] = '入力フォームの情報が不足しています！'
      redirect_to new_emotion_url and return
    end

    flash[:success] = '新しいキモチを登録しました。'
    redirect_to emotions_url
  end

  def destroy
    emotion = find_my_emotion(params[:id])
    if emotion
      emotion.destroy
      flash[:success] = "キモチ「#{emotion.name}」を削除しました。"
    else
      flash[:danger] = 'キモチを削除しようとしましたが、指定されたキモチが見つかりませんでした。'
    end
    redirect_to emotions_url
  end

  private
  def emotion_params
    params.require(:emotion).permit(:name, :color, :context, fragments: [])
  end

  def find_my_emotion(emotion_id)
    current_user.emotions.find_by(id: emotion_id)
  end
end
