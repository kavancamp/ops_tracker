Rails.application.routes.draw do
  root "dashboard#index"
  get "dashboard", to: "dashboard#index"
  resources :locations, only: [ :index, :new, :create, :show, :edit, :update ]
  resources :assets, path: "equipment", only: [ :index, :new, :create, :show, :edit, :update ] do
    resources :maintenance_records, only: [ :new, :create ]
  end
end
