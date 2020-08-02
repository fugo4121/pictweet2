class TweetsController < ApplicationController
#lkjfdajggggggggghhhhhh
  # editとshowの、対象id投稿データを@tweetに入れる処理が同じため、まとめる
  before_action :set_tweet, only: [:edit, :show]

  def index
    # 3 Tweetテーブルのデータ全て取得
    @tweets = Tweet.all
  end

  def new
    # 投稿ページから新しくデータベースに登録する空のレコードを生成
    # form_withのmodelでレコードが空か判断するために定義
    # new.htmlに引き渡すため、@をつける
    @tweet = Tweet.new
  end

  def create
    # new.html→ルーティングより受け渡されたパラメータをテーブルに保存
    Tweet.create(tweet_params)
  end

  def destroy
    # index.html→ルーティングのdeleteメソッドにidを渡して、そのidを指定して削除
    # テーブル削除時の投稿データは、このメソッドでしか使用しないため、@をつけない
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def edit
    # index.html→ルーティングで受け取ったidの投稿をeditビューのフォームで編集できるようにする
    # @tweet = Tweet.find(params[:id])
  end

  def update
    # edit.htmlにより、変更した対象のid投稿データを更新させる
    # 新規投稿と更新許可するカラムは同じ
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end

  def show
    # index.html→ルーティングで受け取ったidの投稿のみを表示
    # @tweet = Tweet.find(params[:id])
  end

  private
  def tweet_params
    # 受け取ったパラメータで、tweetテーブルのname,image,textのカラムデータしか受け取らなくする
    # require(要求) permit(許可)
    # 指定カラムの許可を行う時、どのテーブルの要求かを指定しないとエラーとなる
    params.require(:tweet).permit(:name, :image, :text)
  end


  def set_tweet
    @tweet = Tweet.find(params[:id])
  end




end
