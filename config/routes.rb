Rails.application.routes.draw do
  resources :content_items
  root to: 'content_items#new'
  get 'search_form' => "content_items#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
