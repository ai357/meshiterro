class FavoritesController < ApplicationController

  # お気に入り登録
  def create
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.new(post_image_id: post_image.id)
    favorite.save
    redirect_to post_image_path(post_image)
  end

  # お気に入り
  def destroy
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)
    favorite.destroy
    redirect_to post_image_path(post_image)
  end

end
