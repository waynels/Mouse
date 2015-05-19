Rails.application.routes.draw do
  resources :breeds do
    member do
      post "save_mice_cage"
      post "save_die_record"
      post "save_appraisal_mouse"
      get "disable"
    end
    collection do
      post 'get_data'
      get "cage"
      get "cage_info"
      get "appraisal_mouse"
      get "show_mouse"
      get "edit_mouse"
      get "die_record"
    end
  end
  resources :batches
  resources :baskets do 
    collection do
      get 'autocomplete'
    end
  end
  resources :mice do
    collection do
      post 'get_data'
      get 'autocomplete'
    end
    member do
      get "family_tree"
      get "get_family_tree"
    end
  end
  resources :strains do
    collection do
      post 'get_data'
    end
  end
  
  devise_for :users, controllers: {
        registrations: 'discustom/registrations',
        confirmations: 'discustom/confirmations',
        passwords: 'discustom/passwords',
        sessions: 'discustom/sessions'
      }
  
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end
  resources :user, :controller => "user" do
    collection do
      post 'get_data'
    end
    member do
      get 'set_roles'
      put 'save_roles'
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'user#index'
  root 'baskets#index'
  get "welcome/lock_screen"
  post "welcome/unlock"
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
