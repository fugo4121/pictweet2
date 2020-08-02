class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      # urlはとても長い文字列、改行せずに１行で表示
      # textは改行など行う時もある為、複数行で表示
      t.string :name
      t.string :text
      t.text :image
      t.timestamps
    end
  end
end
