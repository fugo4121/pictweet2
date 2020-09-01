class TweetsController < ApplicationController

  # 該当アクションの時は、対象id投稿データを@tweetに入れる処理が同じため、まとめる
  before_action :set_tweet, only: [:edit, :show]
  # 該当アクションの時は、未ログイン時にindexへリダイレクトするのを除外
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    # Tweetテーブル全データ取得→紐づいたUserテーブルも全て取得
    # includeにより、Tweetテーブル全てと、紐づいたテーブル全てを取得できる
    # レコード作成日を指定し、降順で並び替え
    @tweets = Tweet.includes(:user).order("created_at DESC")
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
    # before_actionで、下記をアクション処理前に行うように定義
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
    # before_actionで、下記をアクション処理前に行うように定義
    # @tweet = Tweet.find(params[:id])

    # -----------------------------

    # 新しくコメントを投稿するレコード作成
    # 選択したtweetに対する全てのcommentを取得し(モデル親子関係)、tweet_idに紐づいたuser_idのuser情報も取得する
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  # indexの検索ワードをルーティングを通して引継ぎ、tweetモデルのインスタンスメソッドより、取得データ絞り込み
  def search
    @tweets = Tweet.search(params[:keyword])
  end

  private
  def tweet_params
    # 受け取ったパラメータで、tweetテーブルのname,image,textのカラムデータしか受け取らなくする
    # require(要求) permit(許可)
    # 指定カラムの許可を行う時、どのテーブルの要求かを指定しないとエラーとなる
    # 後からコマンドで追加した、tweetテーブルのuser_idカラムの要求許可する(ハッシュをmergeで繋げる)
    # current_userにより、ログインユーザーの情報を取得する
    # 投稿者をuserテーブルのnicknameで管理するようになったため、tweetのnameが不要となる
    params.require(:tweet).permit(:image, :text).merge(user_id: current_user.id)
  end


  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end


