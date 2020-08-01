Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :dogs, only: [:index, :show, :create, :update, :destroy] do
        resources :comments, only: [:index, :create]
      end
    end
  end
end
