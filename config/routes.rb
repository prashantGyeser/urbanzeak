require 'subdomain'

Rails.application.routes.draw do

  get '/purchases' => 'dashboard/purchases#index', as: :user_root
  devise_for :users

  root 'home#index'

  resources :experiences
  resources :attendees
  resources :hosts
  post "conversations/create" => "conversations#create"

  namespace :dashboard do
    root :to => "purchases#index"
    resources :experiences
    resources :purchases
    get 'profile/about'
    post 'profile/delete-picture' => "profile#delete_picture"
    get "messages" => "messages#index"
    post "messages/create" => "messages#create"
    get "reviews" => "reviews#index"
    post 'reviews/add_review_to_show' => "reviews#add_review_to_show"
    post 'experiences/facebook_share' => "experiences#facebook_share"
    get "integrations" => "integrations#index"
    get 'integrations/facebook'
    get 'integrations/facebook_finalizeOAuth'
    post 'integrations/postToFacebook'
    post 'integrations/setConfig'
  end




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
