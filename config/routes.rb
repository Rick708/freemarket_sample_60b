Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  get 'login' => 'items#login' #ログインページ
  get 'signin' => 'items#signin' #サインインページ

  root to: "items#index" #トップページ
  
  resources :items 


  resources :users do
    collection do
      get :logout
      get :sell_list
      get :profile
    end
  end

  resources :card, only: [:new, :show, :destroy] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
    end
  end

  resources :purchase, only: [:index] do
    member do
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
    member do 
     get 'index'
    end
  end

  #各ページの内容の概要（実装完了したものから消してください）
  get 'search' => 'items#search' #検索結果のページ
  # get 'verification' => 'items#verification' #購入内容確認
  # get 'identification' => 'items#identification' #マイページの本人情報登録
  # get 'tell' => 'items#tell' #新規登録の電話番号認証
  # get 'address' => 'items#address' #新規登録の住所登録 
  # get 'paymethod' => 'items#paymethod' ##新規登録のお支払い方法
  get 'profile' => 'mypages#profile' #マイページのプロフィール編集
end