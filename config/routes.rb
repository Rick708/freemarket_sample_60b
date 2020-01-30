Rails.application.routes.draw do
  root 'items#index' #トップページ
  get 'profile' => 'mypage#profile' #マイページのプロフィール編集
  get 'login' => 'items#login' #ログインページ
  get 'signin' => 'items#signin' #サインインページ
  get 'details' => 'items#details' #商品詳細ページ
  get 'registration' => 'items#registration' #新規登録の会員情報入力
  get 'verification' => 'items#verification' #購入内容確認
  get 'mypage' => 'mypage#index' #マイページ
  get 'logout' => 'items#logout' #マイページのログアウト　
  get 'identification' => 'items#identification' #マイページの本人情報登録　まだ
  get 'tell' => 'items#tell' #新規登録の電話番号認証
  get 'doneview' => 'items#doneview' #新規登録の完了画面
  get 'address' => 'items#address' ##新規登録の住所登録
  get 'paymethod' => 'items#paymethod' ##新規登録のお支払い方法
  get 'register_credit' => 'items#register_credit' #マイページの支払い方法
  get 'new' => 'items#new' #商品出品ページ
end
