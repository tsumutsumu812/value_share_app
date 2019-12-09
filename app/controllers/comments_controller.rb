class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      flash[:notice] = "コメントを保存しました。"
      redirect_to comment.value
    else
      flash[:comment] = comment
      flash[:error_messages] = comment.errors.full_messages
      redirect_back fallback_location: comment.value
    end 
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to comment.value, flash: { notice: 'コメントが削除されました' }
  end

  def comment_params
    params.require(:comment).permit(:value_id, :name, :comment)
  end
end
