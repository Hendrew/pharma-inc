Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, except: :create do
        get :import, on: :collection
      end
    end
  end
end
