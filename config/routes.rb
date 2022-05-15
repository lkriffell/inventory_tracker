Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items, :only => [:index, :create, :edit]

  post "/warehouses", to: "warehouses#create"
  get "/warehouses/:id/add_item/:item_id", to: "warehouses#add_item"
end
