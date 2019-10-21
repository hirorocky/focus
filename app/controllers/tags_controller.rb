class TagsController < ApplicationController
  def create
    if current_user.tags.create(tag_params).valid?
      flash[:success] = '新しいタグを登録しました。'
    else
      flash[:danger] = '情報が不足しています！'
    end
    redirect_to tags_url
  end

  def index
    @new_tag = Tag.new
    @tags = current_user.tags
  end

  def destroy
    tag = current_user.tags.find(params[:id])
    if tag
      tag.destroy
      flash[:success] = "タグ「#{tag.name}」を削除しました。"
    else
      flash[:danger] = 'タグを削除しようとしましたが、指定されたキモチが見つかりませんでした。'
    end
    redirect_to tags_url
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
