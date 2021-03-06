Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  
  root 'favours#index'
  get 'favours/new' => 'favours#new'
  post 'favours' => 'favours#create'

  get 'favours/:id/delete' => 'juans#delete'
  get 'home' => 'favours#home'
  get 'favours/:id' => 'favours#show'

  devise_for :juans
  devise_for :runners
  resources :juans

  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end


end
