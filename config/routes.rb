Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"



  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create] # É necessário nestar outro resource, pois serão necessárias duas páginas. Sendo o review vinculado ao restaurant. Pra criar um review é preciso atribuir ao um restaurant_id
  end
  resources :bookmarks, only: :destroy
  root 'lists#index'
end
