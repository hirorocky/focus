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
  end

  def create
    emotion = current_user.emotions.new(emotion_params)
    if emotion.save
      flash[:success] = '新しいキモチを登録しました。'
      redirect_to emotions_url
    else
      flash[:danger] = '情報が不足しています！'
      redirect_to new_emotion_url
    end
  end

  def destroy
    emotion = find_my_emotion(params[:id])
    if emotion
      emotion.destroy
      flash[:success] =  "キモチ「#{emotion.name}」を削除しました。"
    else
      flash[:danger] = "キモチを削除しようとしましたが、指定されたキモチが見つかりませんでした。"
    end
      redirect_to emotions_url
  end

  private
  def emotion_params
    params.require(:emotion).permit(:shape, :color, :name, :detail)
  end

  def find_my_emotion(emotion_id)
    current_user.emotions.find_by(id: emotion_id)
  end
end
