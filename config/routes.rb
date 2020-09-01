Rails.application.routes.draw do
  devise_for :users
#  Prefix        Verb   URI Pattern                         Controller#Action
#  tweets             GET    /tweets(.:format)                    tweets#index
#                     POST   /tweets(.:format)                    tweets#create
#new_tweet            GET    /tweets/new(.:format)                tweets#new
#edit_tweet           GET    /tweets/:id/edit(.:format)           tweets#edit
#   tweet             GET    /tweets/:id(.:format)                tweets#show
#                     PATCH  /tweets/:id(.:format)                tweets#update
#                     PUT    /tweets/:id(.:format)                tweets#update
#                     DELETE /tweets/:id(.:format)                tweets#destroy

# tweet_comments      POST   /tweets/:tweet_id/comments(.:format) comments#create
# comments            POST   /comments(.:format)                  comments#create

# 検索機能のルーティング
# search_tweets_path	GET	   /tweets/search(.:format)	tweets#search


  # commentをどのtweetのものかを紐づけるため、親子関係のresourcesとする
  # これにより、commentに紐づいているtweetのidもコントローラーに引き継ぐことができる
  resources :tweets do
    resources :comments, only: :create

    # ７つのアクションとは別のアクションを設定(urlを任意に設定→「url名_tweets_path」をビューに設定)
    # collectionはidなし、memberはidあり
    collection do
      get 'search'
    end
    
  end
  resources :users, only: :show
  
    #以下は同じ意味
  # resources :tweets, only: :index
  # get 'tweets', to: 'tweets#index'

  # ---------------------------------

  # /(localhost3000のルート)をindexに変更する
  # 基礎では、localhost3000/tweetで繋いでいたが、今回はlocalhost3000で繋ぐ
  root to: 'tweets#index'

end

