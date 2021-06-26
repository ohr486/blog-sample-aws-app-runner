Rails.application.routes.draw do
  root to: "info#cpu"

  resources :users
  get "/info/cpu", to: "info#cpu"
  get "/info/mem", to: "info#mem"
end
