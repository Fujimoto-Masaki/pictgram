class CommentsController < ApplicationController
  #def index
    #@comments = Comment.all
  #end

  def new
    #@topic = Topic.find(params[:topic_id])
    @comment = Comment.new
  end

  def create
    #@topic = Topic.find(params[:topic_id])
    @comment = Comment.new(comment_params)
    @comment.topic_id = params[:topic_id]
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to topics_path, success: "コメントしました"
    else
      flash.now[:danger] = "コメントできません"
      render :new
    end
  end

  #def destroy
    #@topic = Topic.find(params[:topic_id])
    #@comment = @topic.comment.find(params[:id])
    #@comment.destroy
    #redirect_back(fallback_location: topic_path(topic)
  #end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end
