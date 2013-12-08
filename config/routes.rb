Uni::Application.routes.draw do
  devise_for :users , :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => "register"}
  root :to =>  "welcome#index"
  #match "sessions#user" ,as: "sessions#create"
  #get "welcome/" => "welcome#index", as: "welcome"
  devise_scope :user do 
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end
  
  scope 'features/' do

  get 'dictionary' => 'features#dictionary'
  get 'education' => 'features#education'
  get 'batch_messages' => 'features#batch_messages'
  get 'dictionary' => 'features#foo'

  end
  
  resources :users
  resources :sessions
  get "users/new" => "users#new" , as: "sign_up" 
  get "tos/"   => "welcome#tos", as: "terms"
  get "users/:action" => "users#:action" # this is temporaly
# The priority is based upon order of creation: first created -> highest priority.
# See how all your routes lay out with "rake routes".

# You can have the root of your site routed with "root"
# root 'welcome#index'

# Example of regular route:
#   get 'products/:id' => 'catalog#view'

# Example of named route that can be invoked with purchase_url(id: product.id)
#   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

# Example resource route (maps HTTP verbs to controller actions automatically):
#   resources :products

# Example resource route with options:
#   resources :products do
#     member do
#       get 'short'
#       post 'toggle'
#     end
#
#     collection do
#       get 'sold'
#     end
#   end

# Example resource route with sub-resources:
#   resources :products do
#     resources :comments, :sales
#     resource :seller
#   end

# Example resource route with more complex sub-resources:
#   resources :products do
#     resources :comments
#     resources :sales do
#       get 'recent', on: :collection
#     end
#   end

# Example resource route with concerns:
#   concern :toggleable do
#     post 'toggle'
#   end
#   resources :posts, concerns: :toggleable
#   resources :photos, concerns: :toggleable

# Example resource route within a namespace:
#   namespace :admin do
#     # Directs /admin/products/* to Admin::ProductsController
#     # (app/controllers/admin/products_controller.rb)
#     resources :products
#   end
end
