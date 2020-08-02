class Tweet < ApplicationRecord
  # 空のtextを登録できなくする validates(検証)
  # 投稿完了ページに飛ぶが、実際は登録されない
  validates :text, presence: true
end
