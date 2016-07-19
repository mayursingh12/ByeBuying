Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  namespace :admin do

    get '/' => 'welcome#index'
    post 'sign_in' => 'welcome#log_in', as:'sign_in'
    get 'dashboard' => 'welcome#dashboard'

    resources :categories

    resources :subcategories

    resources :states

    resources :cities

    get 'subcategories/get_subcategories_for_category/:id' => 'subcategories#get_subcategories_for_category', as:'get_subcategories_for_category'

    resources :advertisements do

      collection do
        get 'pending_advertisements'
      end

      member do
        put :admin_approve
      end

      resources :advertisement_images

    end

    resources :customers

    resources :products

  end

  namespace :customer do

    get '/' => 'welcome#index'
    post 'sign_in' => 'welcome#log_in', as:'sign_in'
    get 'registration' => 'welcome#registration'
    post 'sign_up' => 'welcome#sign_up', as:'sign_up'
    get 'dashboard' => 'welcome#dashboard'
    get 'profile' => 'welcome#profile'

    resources :advertisements do
      resources :advertisement_images
    end

    resources :products do
      resources :product_images
    end

    resources :services do
      resources :service_images
    end

  end

  get 'about_us' => 'welcome#about_us'
  get 'categories' => 'welcome#categories', as:'categories'
  get 'product_detail' => 'welcome#product_detail'
  get 'blog' => 'welcome#blog'
  get 'contact_us' => 'welcome#contact_us'

  get 'cities/collection_by_state/:id' => 'cities#collection_by_state', as:'collection_by_state'

  get 'get_subcategories/:id' => 'subcategories#get_subcategory'

  get 'test' => 'welcome#test'

end
