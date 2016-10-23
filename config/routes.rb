Rails.application.routes.draw do

  # it should allow our root folder to display session register view
  root 'sessions#new'

  # it should allow our app to create a new lender account
  post 'online_lending/lender' => 'lenders#create'

  # it should allow our app to create a new borrower account
  post 'online_lending/borrower' => 'borrowers#create'

  # it should authenticate users
  post 'online_lending/login' => 'sessions#create'

  # it should allow our users to login
  get 'online_lending/login' => 'transactions#login'

  # it should allow our lenders to lend
  post 'online_lending/lender/:id' => 'transactions#lend_money'

  # it should allow our lenders to see what is transactions are available
  get 'online_lending/lender/:id' => 'transactions#lender_show'

  # it should allow our borrowers to see their lending amounts
  get 'online_lending/borrower/:id' => 'transactions#borrower_show'

  get 'sessions/new'

  get 'sessions/create'

  # it should allow our user to logout
  get '/logout' => 'sessions#destroy'

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
