Rails.application.routes.draw do
  get 'search/index'
  get 'search/show'
  post 'search/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Resque::Server, :at => "/resque"

end
