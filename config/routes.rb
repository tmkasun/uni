Uni::Application.routes.draw do
  resources :trackers

  resources :profiles
  get '/test' => 'welcome#test' #for debuging purpose only

  devise_for :users , :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => "register"}
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users/:id' => 'devise/registrations#update', :as => 'user_registration'
  end

  root :to =>  "welcome#index"
  #match "sessions#user" ,as: "sessions#create"
  #get "welcome/" => "welcome#index", as: "welcome"
  devise_scope :user do
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end

  scope 'features/' do
    get 'mailer' => 'features#mailer'
    get 'dictionary' => 'features#dictionary'
    get 'education' => 'features#education'
    get 'batch_messages' => 'features#batch_messages'
    post 'search' => 'features#search'
    get 'search' => 'features#search'
  end



  post 'gpa/display_gpa'
  post 'gpa/calculate_gpa'
  get 'gpa/enter_level_semester'
  post 'gpa/add_subject'
  post 'gpa/remove_subject'


  get "user/register" => "features#add_user"
  post "user/create" => "features#create_user"

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
