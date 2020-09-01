class CommentsController < ApplicationController

  # tweets/showからルーティングへ引き継いだデータを登録
  # 登録データを変数に代入し、リダイレクトで変数のid(コメントしたtweet)に対するtweetモデルのshowアクションを行う
  def create
    comment = Comment.create(comment_params)
    redirect_to "/tweets/#{comment.tweet.id}"
  end

  private

  # commentテーブルは、text、user_id、tweet_idのみ許可
  # user_idは、ログインユーザーのid tweet_idは、選択中のtweetのidをここでセットするため、mergeを使用している
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end

end
