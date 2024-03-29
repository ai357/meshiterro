class PostCommentsController < ApplicationController

  # コメント機能
  def create
    post_image = PostImage.find(params[:post_image_id])
    # ログイン中ユーザーのPost_commentsカラムの中に枠をつくる
    comment = current_user.post_comments.new(post_comment_params)
    # 右辺のpost_image.idは5行目post_image
    comment.post_image_id = post_image.id
    # コメント保存
    comment.save
    redirect_to post_image_path(post_image)
  end

  # コメント削除
  def destroy
    # PostCommentモデルから見つけて削除する
    PostComment.find(params[:id]).destroy
    # 削除後、post_imageページに戻る
    redirect_to post_image_path(params[:post_image_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
