Rails.application.routes.draw do
  resources :orders, only: [:new, :create, :index, :show] do

    resource :receipt
  end

  get '/orders/ajax_filter_orders/:key', to:'orders#ajax_filter_orders'

  root to: 'dashboard#show'
end
