require 'subdomain'

Urbanzeak::Application.routes.draw do

  post "conversations/create" => "conversations#create"



  # Sending a user to the dashboard page once they login
  # Taken from http://excid3.com/blog/rails-tip-5-authenticated-root-and-dashboard-routes-with-devise/
  authenticated :user do 
    #root :to => "dashboard/reports#index", :as => "authenticated_root"
    root :to => "dashboard/purchases#index", :as => "authenticated_root"
  end

  resources :experience_images

  post "images/create_header"
  post "image/create_slider"
  
  resources :advance_bookings

  resources :messages

  get "/email_processor", to: proc { [200, {}, ["OK"]] }, as: "mandrill_head_test_request"

  get "chat/index"
  namespace :dashboard do
    get "home" => "home#index"
    root :to => "purchases#index"
    get "chat" => "chat#index"
    get "experiences" => "experiences#index"
    get "experiences/new/:experience_id" => "experiences#new"
    get "experiences/new"
    get "experiences/show"
    get "experience/edit"
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
    get "profile/about"
    get "messages" => "messages#index"
    get "messages/:id" => "messages#show"
    post "messages/create" => "messages#create"
    get "purchases" => "purchases#index"
    get "reports" => "reports#index"
    get "algo" => "algo#index"
    get "reviews" => "reviews#index"
    post 'reviews/add_review_to_show' => "reviews#add_review_to_show"
    post 'experiences/facebook_share' => "experiences#facebook_share"
    get 'experiences/:id/edit' => "experiences#edit"
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
  #get "experiences/get/:country", to: "experiences#country"
  get "experiences/available_dates", to: "experiences#available_dates"
  resources :experiences
  post 'experiences/create_review' => "experiences#create_review"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  # Redirecting when a subdomain is found to the appropriate page
  constraints(Subdomain) do
    get '/' => "experiences#index"
  end
  #, :constraints => { :subdomain => /.+/ }
  match '/:id' => "shortener/shortened_urls#show", via: [:get]


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
