Rails.application.routes.draw do
  root "locations#index"

  resources :locations, only: [ :index, :new, :create, :show, :edit, :update ]
  resources :assets, path: "equipment", only: [ :index, :new, :create, :show, :edit, :update ]
end
