GroupedServer::Application.routes.draw do
  
  match "groups/new", to: 'groups#new', via: :post
    
  match "checkins/new", to: "checkins#new", via: :post
  match "checkins/index", to: "checkins#index", via: :get
  
end
