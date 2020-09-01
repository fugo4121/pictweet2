class Tweet < ApplicationRecord
  # 空のtextを登録できなくする validates(検証)
  # 投稿完了ページに飛ぶが、実際は登録されない
  validates :text, presence: true

  # tweetに対するuserは、1対1で紐付け
  belongs_to :user

  # tweetに対するcommentは、1対多で紐付け
  has_many :comments

  # indexの検索ワード→ルーティング(search)→コントローラーのsearchアクション
  # 以下のインスタンスメソッドは、コントローラーのsearchアクションから呼び出す
  # テーブルとのやりとりは、モデル内のメソッドを通じて行う
  # 検索ワードをパラメータとして引き継いできたsearchに何か入っていれば、
  # searchの値を含んだtweetテーブルのデータを取得
  # searchに何も入っていなければ、全てのtweetテーブルのデータを取得
  def self.search(search)
    if search
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end

end
