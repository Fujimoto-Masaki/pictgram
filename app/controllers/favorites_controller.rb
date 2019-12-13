class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]
    #@favorites_count = Favorite.where(user_id: current_user.id).count

    if favorite.save
      redirect_to topics_path, success: 'お気に入りに登録しました'
    else
      redirect_to topics_path, danger: 'お気に入りに登録に失敗しました'
    end
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    if favorite.destroy
      redirect_to topics_path, success: 'お気に入りから削除しました'
    else
      redirect_to topics_path, danger: 'お気に入りの削除に失敗しました'
    end
  end

  #def user_id_params
    #params.require(:user_id).permit(:current_user.id)
  #end

  #def topic_id_params
    #params.require(:topic_id).permit(:topic_id)
  #end

  #または
  #def favorite_params
    #params.require(:favorite).permit(:user_id,:topic_id)
  #end

end
