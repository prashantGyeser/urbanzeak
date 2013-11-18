LetsdineUpdated::Application.routes.draw do

  root to: 'homes#index'
  resources :homes


  # Api namespace
  namespace :api, defaults: { format: 'json' } do 
    namespace :v1 do
      resources :experiences
      get '/experiences/:experience_id/images' => 'experiences#images'
      get '/current_user' => 'logged_user#user'
#      devise_for :user, :controllers => { :session => 'api/v1/sessions' }
      devise_for :user#, :skip => :sessions
      devise_scope :user do
        #post "/users/sign_in" => "devise/sessions#create"
        match "/api/v1/users/sign_in" => "devise/sessions#create", via: [:post]
        delete "/users/sign_out" => "devise/sessions#destroy"
      end

      
      #devise_scope :user do
        #post "login", :to => "api/v1/sessions#create"
      #end
      #get 'current_user' => 'logged_user#user' #, :as => 'current_user'

    end
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
