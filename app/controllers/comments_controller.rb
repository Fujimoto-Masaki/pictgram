class CommentsController < ApplicationController
  #def index
    #@comments = Comment.all
  #end

  def new
    @comment = Comment.new
  end

  def create
    #@comment = Comment.new
    #topic = Topic.find(params[:topic_id])
    @comment = topic.comments.new(comment_params)
    #topic_idを渡す必要がある
    if @comment.save
      redirect_to topics_path, success: "コメントしました"
      #redirect_back(fallback_location: image_url(topic.id))
    else
      flash.now[:danger] = "コメントできません"
      render :new
      #redirect_back(fallback_location: image_url(topic.id))
    end
  end

  #def destroy
    #topic = Topic.find(params[:topic_id])
    #@comment = topic.comments.find(params[:id])
    #@comment.destroy
    #redirect_back(fallback_location: topic_path(topic)
  #end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
