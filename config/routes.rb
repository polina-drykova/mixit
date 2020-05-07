Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/error', to: 'pages#error'
  ### Cocktails:
  # 1. can see list of cocktails: get 'cocktails'
  # --> index
  # 2. can see the details of a given cocktail,
  # with the dose needed for each ingredient: get 'cocktails/42'
  # --> show
  # 3. can create a new coctail: get 'cocktails/new'; post 'cocktails'
  # --> new
  # --> create

  ### Doses:
  # 1. A user can add a new dose (ingredient/description pair)
  # to an existing cocktail
  # GET "cocktails/42/doses/new"
  # POST "cocktails/42/doses"
  # --> new
  # --> create
  # 2. A user can delete a dose that belongs to an existing cocktail.
  # DELETE "doses/25"
  # --> destroy
  resources :cocktails, only: [:index, :show, :new, :create, :destroy] do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
end
