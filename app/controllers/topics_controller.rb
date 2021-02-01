class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = current_user.topics.new(topic_params)
    
    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  def edit
    @topic = find_topic_by_id
  end
  
  def update
    @topic = find_topic_by_id
    
    if @topic.update(topic_params)
      redirect_to user_path(current_user.id), success: '投稿の編集に成功しました'
    else
      flash.now[:danger] = "投稿の編集に失敗しました"
      render :edit
    end
  end
  
  def destroy
    @topic = find_topic_by_id
    
    if @topic.destroy
      redirect_to topics_path, success: '投稿を削除しました'
    else
      flash.now[:danger] = "投稿の削除に失敗しました"
      redirect_to topics_path
    end
  end
  
  private
  def topic_params
    params.require(:topic).permit(:title, :description, :level, :favorite_line)
  end
  
  def find_topic_by_id
    Topic.find(params[:id])
  end
end
