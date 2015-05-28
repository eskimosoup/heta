Heta::Application.routes.draw do
  get "sitemap" => "application#sitemap"

  namespace :admin do
    manticore_resources :seo_entries do
      get 'rebuild_seo', :on => :collection
    end
  end

  resources :team_members,            path: "management-team"
  resources :apprentice_pathways,     only: [:index, :show]
  resources :available_apprentices,   only: [:index]
  resources :galleries,               only: [:index]
  resources :pages,                   only: [:show]

  resources :course_searches,         only: [:create, :index, :update, :show]
  resources :course_instances,        only: [:show]
  resources :articles,                only: [:index, :show]

  resources :companies,               only: [:index, :show]
  resources :contacts,                :only => [:new, :create]

  resources :apprentices, only: [:index, :show] do
    get 'apprentice_modal', :on => :member
  end

  resources :courses, only: [:index, :show] do
    get 'course_calendar', on: :collection
  end



  namespace :admin do
    chronicler_resources :team_members
    chronicler_resources :available_apprentices
    chronicler_resources :apprentice_pathways
    chronicler_resources :pages
    chronicler_resources :banners
    chronicler_resources :companies
    chronicler_resources :apprentices
    chronicler_resources :footer_icons
    chronicler_resources :articles
    chronicler_resources :galleries
    manticore_resources :home_promotions
    manticore_resources :display_toggles
    manticore_resources :course_searches
    manticore_resources :courses
    manticore_resources :course_instances
    manticore_resources :course_categories
    manticore_resources :training_locations
  end

  root :to => "application#index"

  mount Manticore::Engine => "/admin"

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
