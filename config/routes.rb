Rails.application.routes.draw do

  resources :products

  root 'products#index'
  get 'products/price/:id' => 'products#price'  # for getting price of product by ajax

  devise_for :users
  get '/add_to_cart/:product_id' => 'user_cart#add_to_cart', :as => 'add_to_cart'   #add to cart by ajax
  get '/view-cart/' => 'ordercart#view_cart'    #open cart for user
  get '/show_sellers/' => 'seller#show_seller'  #show user list for making them as seller
  get '/make_seller/:user_id' => 'seller#make_seller' , :as => 'make_seller'  # make user as seller by ajax
  get '/upload-product/' => 'products#new'      #creating product
  get 'auth/facebook/callback', to: 'sessions#create'  #facebook url
  get 'auth/failure', to: redirect('/')
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
