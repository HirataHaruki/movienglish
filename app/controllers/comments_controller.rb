class CommentsController < ApplicationController
  def new
    @topic = Topic.find_by(id: params[:topic_id])
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
    @topic = Topic.find_by(id: params[:topic_id])
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    
    if @comment.update(comment_params)
      redirect_to topics_path, success: 'コメントを編集しました'
    else
      flash.now[:danger] = 'コメントの編集に失敗しました'
      render :edit
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    
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
end
