SunServer::Application.routes.draw do

  resources :apps

  resources :download_permissions

  resources :pdf_activities

  resources :apks do
    collection do
      post 'get_updates'
    end
  end
  resources :machine_types
  resources :api do
    collection do
      get 'subjects'
      get 'courses'
      get 'chapters'
      get 'lessons'
      get 'sections'

      get 'activities'
      get 'edges'
      get 'gallery_images'
      get 'quiz_components'
      get 'section_components'
      get 'problems'
      get 'problem_choices'

      get 'authors'
      get 'books'
      get 'book_collections'
      get 'tags'
      get 'books_tags'
      get 'book_collections_tags'
    end
  end
  resources :user_records do
    collection do
      post 'batch_update'
    end
  end

  resources :schools do
    collection do
      get 'get_all'
    end
  end
  resources :classrooms
  devise_for :admins
  scope "/super" do
    resources :admins do
      member do
        get 'change_password'
      end
    end
  end
  resources :users do
    collection do
      get 'batch_new'
      post 'batch_create'
    end
  end
  resources :providers
  resources :machines do
    collection do
      post 'sign_in'
    end
    member do
      post 'sign_out'
      post 'lock'
      post 'unlock'
    end
  end

  match 'subjects/overview/:id'  => 'subjects#overview'
  resources :subjects
  resources :courses
  resources :lessons
  resources :chapters
  resources :sections
  resources :activities do
    collection do
      post 'add_form'
    end
  end
  resources :section_components
  resources :video_activities
  resources :audio_activities
  resources :gallery_activities
  resources :images
  resources :text_activities
  resources :html_activities
  resources :quiz_activities do
    member do
      post 'remove_problem'
    end
  end
  resources :quiz_components
  resources :edges
  resources :problems do
    get 'add_choice', :on => :collection
  end
  resources :tag_bundles
  resources :problem_choices

  resources :book_collections
  resources :books
  resources :video_collections
  resources :videos
  resources :audio_collections
  resources :audios
  resources :authors
  resources :tags

  match 'download/:action/:id', controller: "Download"

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
  root :to => 'schools#my_school'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'

  mathjax 'mathjax'

end
