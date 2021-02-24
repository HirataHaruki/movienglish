class UnfavoritesController < ApplicationController
  def create
    unfavorite = Unfavorite.new
    unfavorite.user_id = current_user.id
    unfavorite.topic_id = params[:topic_id]
    
    if unfavorite.save
      redirect_to topics_path, success: '低評価登録に成功しました'
    else
      redirect_to topics_path, danger: '低評価登録に失敗しました'
    end
  end
  
  def destroy
    Unfavorite.find_by(user_id: current_user.id, topic_id: params[:id]).destroy
    flash[:success] = "低評価登録を解除しました"
    redirect_to topics_path
  end
end
