GroupedServer::Application.routes.draw do
  
  resources :members


  match "groups/new", to: 'groups#new', via: :post
  match "groups/join", to: 'groups#join', via: :post
  match "groups/delete", to: 'groups#delete', via: :delete


  match "checkins/new", to: "members#checkin", via: :post
  match "checkins/get", to: "members#get", via: :get

  match "messages/new", to: "messages#new", via: :post
  match "messages/get", to: "messages#get", via: :get
  
end
