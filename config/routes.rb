Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/items", to: "items#index"
  get "/items/new", to: "items#create"
  get "/items/:id/edit", to: "items#edit"


  get "/warehouses/new", to: "warehouses#create"
  get "/warehouses/:id/add_item/:item_id", to: "warehouses#add_item"
end
