GroupedServer::Application.routes.draw do
  
  resources :members


  match "groups/new", to: 'groups#new', via: :post
  
end
