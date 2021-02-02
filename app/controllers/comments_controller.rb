class CommentsController < ApplicationController
  def new
    @topic = find_by_topic_params_id
    @comment = Comment.new
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to topics_path, success: 'コメント投稿に成功しました'
    else
      flash.now[:danger] = 'コメント投稿に失敗しました'
      render :new
    end
  end
  
  def edit
    @topic = find_by_topic_params_id
    @comment = find_comment_by_id
  end
  
  def update
    @comment = find_comment_by_id
    
    if @comment.update(comment_params)
      redirect_to topics_path, success: 'コメントを編集しました'
    else
      flash.now[:danger] = 'コメントの編集に失敗しました'
      render :edit
    end
  end
  
  def destroy
    @comment = find_comment_by_id
    
    if @comment.destroy
      redirect_to topics_path, success: 'コメントを削除しました'
    else
      flash.now[:danger] = 'コメントの削除に失敗しました'
      redirect_to topics_path
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :topic_id, :user_id)
  end
  
  def find_comment_by_id
    Comment.find(params[:id])
  end
  
  def find_by_topic_params_id
    Topic.find_by(params[:topic_id])
  end
end
