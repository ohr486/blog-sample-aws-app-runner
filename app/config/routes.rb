Rails.application.routes.draw do
  resources :users
  get "/info/cpu", to: "info#cpu"
  get "/info/mem", to: "info#mem"
end
