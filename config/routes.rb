GroupedServer::Application.routes.draw do
  
  match "groups/new", to: 'groups#new', via: :post
  
end
