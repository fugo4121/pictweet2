class UsersController < ApplicationController
  def show
    # /users/(user.id)
    # ログイン中のuser.nicknameと、紐づいているtweetテーブルの全データ取得しビューに受渡し
    # @nickname = current_user.nickname
    # @tweets = current_user.tweets

    # クリックされたユーザーのidデータを取得し、ニックネームとtweetテーブルをビューに受渡し
    # tweet.index→/users/(tweet.user.id)→ルーティングでid引継ぎ→user.controllerのshowアクション
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets

  end
end
