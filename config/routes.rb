Rails.application.routes.draw do
#  Prefix   Verb   URI Pattern                         Controller#Action
#  tweets   GET    /tweets(.:format)                    tweets#index
#           POST   /tweets(.:format)                    tweets#create
#new_tweet  GET    /tweets/new(.:format)               tweets#new
#edit_tweet GET    /tweets/:id/edit(.:format)         tweets#edit
#   tweet   GET    /tweets/:id(.:format)                tweets#show
#           PATCH  /tweets/:id(.:format)                tweets#update
#           PUT    /tweets/:id(.:format)                tweets#update
#           DELETE /tweets/:id(.:format)                tweets#destroy

  #以下は同じ意味
  # resources :tweets, only: :index
  # get 'tweets', to: tweets#index

  resources :tweets

  # /(localhost3000のルート)をindexに変更する
  # 基礎では、localhost3000/tweetで繋いでいたが、今回はlocalhost3000で繋ぐ
  root to: 'tweets#index'

end
