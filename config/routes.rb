Rails.application.routes.draw do
#管理者ログイン
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}


  namespace :admin do
    root to: 'articles#index'
  #品種追加
    resources :breeds, only: [:index,:new,:create,:show,:edit,:update,:destroy]
  #ジャンル追加
    resources :genres, only: [:index,:new,:create,:edit,:update,:destroy]
  #記事投稿
    resources :articles, only: [:index,:new,:create,:show,:edit,:update,:destroy] do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create]
    end
  end

  get   'contacts'         => 'contacts#index'     # 入力画面
  post  'contacts/confirm' => 'contacts#confirm'   # 確認画面
  post  'contacts/sendmail'  => 'contacts#sendmail'    # 送信完了画面
  get "contacts/thanks" => 'contacts#thanks'
#予約情報
  resources :reservations, only: [:index,:new,:create,:show,:edit,:update,:destroy]
#お問い合わせ
  resources :contacts, only: [:new,:thanks,:confirm]
#マップ
  resources :maps, only: [:index]
#予約情報
  resources :events, only: [:index,:new,:create,:show,:edit,:update,:destroy]
#レビュー
  resources :reviews, only: [:index,:create,:destroy]

   post 'events/confirm' => 'events#confirm'


  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
