class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end
  
  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]
    
    if favorite.save
      redirect_to topics_path, success: '好評価登録に成功しました'
    else
      redirect_to topics_path, danger: '好評価登録に失敗しました'
    end
  end
  
  def destroy
    @favorite = Favorite.find_by(topic_id: params[:topic_id], user_id: current_user.id)
    
    if @favorite.destroy
      redirect_to topics_path, info: '好評価を解除しました'
    else
      flash.now[:danger] = '好評価を解除できませんでした'
      redirect_to topics_path
    end
  end
end
