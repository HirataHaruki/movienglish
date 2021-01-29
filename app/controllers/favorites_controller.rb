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
    Favorite.find_by(params[:topic_id]).destroy
    flash[:success] = "好評価登録を解除しました"
    redirect_to topics_path
  end
end
