Urbanzeak::Application.routes.draw do

  resources :experience_images

  post "images/create_header"
  post "image/create_slider"
  
  resources :advance_bookings

  resources :messages

  #get "/email_processor", to: proc { [200, {}, ["OK"]] }, as: "mandrill_head_test_request"

  get "chat/index"
  namespace :dashboard do
    root "home#index"
    get "chat" => "chat#index"
    get "experiences" => "experiences#index"
    get "experiences/new/:experience_id" => "experiences#new"
    get "experiences/new"
    get "experiences/show"
    get "experiences/templates"
    get "experiences/new/:template_id" => "experiences#new"
    get "integrations" => "integrations#index"
    get 'integrations/facebook'
    get 'integrations/facebook_finalizeOAuth'
    post 'integrations/postToFacebook'
    post 'integrations/setConfig'
    get "notifications/communication"
    get "templates" => "templates#index"
    resources :templates
  end

  get "home/index"
  resources :attendees

  get "checkout", to: "checkout#index"
  post "hosts/become_host" => 'hosts#become_host', :as => :become_host
  get "hosts/dashboard"
  resources :hosts

  get "pages/sell"
  get "pages/about"
  get "pages/contact"
  get "pages/terms"
  get "pages/privacy"

  devise_for :users
  get "experiences/get/:country", to: "experiences#country"
  resources :experiences

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  get 'home/:city', to: "home#index"
    
    
  match '/:id' => "shortener/shortened_urls#show", via: [:get, :post]


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
