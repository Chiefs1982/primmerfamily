PrimmerFamily::Application.routes.draw do

  root :to => "pages#home"

  namespace :admin do
    root :to => 'admin#index'
    resources :posts
    resources :potm, :controller => :pic_of_the_months, :except => [:show]
    resources :birthdays, :except => [:show]
    resources :emails, :only => [:index, :show]
    #get '/posts/:article_id(.:format)', :to => 'posts#show', as: :post
    #get '/posts/:article_id/edit(.:format)', :to => 'posts#edit', as: :post_edit
  end

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :comments, :only => [:create, :destroy]
  resources :articles, :only => [:show]
  resources :newsletters, :only => [:index, :create]
  resources :contacts, :only => [:create]
  #resources :forgotPasswords, :only => [:create, :new]
  
  #match '/article/:id(.:format)', :to => "articles#show"
  match '/newsletters/:id(.:format)', :to => 'newsletters#destroy', :as => :newsletterdelete
  match '/signin', :to => "sessions#new"
  match '/signup', :to => "users#new"
  match '/signout', :to => "sessions#destroy"
  match '/about', :to => "pages#about"
  match '/contact', :to => "contacts#new"
  match '/archive', :to => "pages#archive"
  #match '/archive/article/:id', :to => "pages#archive_article"
  match '/miles', :to => "pages#miles"
  match '/vivian', :to => "pages#vivian"
  match '/familytree', :to => "pages#family_tree"
  match '/home', :to => 'pages#home'
  match '/feed', :to => 'feed#index', :defaults => {:format => "atom"}
  match '/7fushksi8/reset/password/user/8oap45dlhh3203f/:id(.:format)', :to => 'forgotPasswords#restore', :as => :fp, :method => :get
  match '/7fushksi8/reset/password/user/9df21d6d551g/:id(.:format)', :to => 'forgotPasswords#update', :as => :up, :method => :put
  match '/forgotpassword/new(.:format)', :to => 'forgotPasswords#new', :as => :new_fp, :method => :get
  match '/forgotpassword(.:format)', :to => 'forgotPasswords#create', :as => :create_fp, :method => :post
  match '/forgotpassword/show(.:format)', :to => 'forgotPasswords#show', :as => :show_fp, :method => :get

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
