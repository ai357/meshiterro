class FavoritesController < ApplicationController

  # お気に入り登録
  def create
    post_image = PostImage.find(params[:post_image_id])
    # ログイン中ユーザーのfavoritesカラムに新規作成
    favorite = current_user.favorites.new(post_image_id: post_image.id)
    favorite.save
    redirect_to post_image_path(post_image)
  end

  # お気に入り削除
  def destroy
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)
    favorite.destroy
    redirect_to post_image_path(post_image)
  end

end
