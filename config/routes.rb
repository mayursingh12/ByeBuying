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

    resources :enquiries

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

    resources :products do
      member do
        put 'update_rating'
        put 'admin_approve'
      end
    end

    resources :services do
      member do
        put 'update_rating'
        put 'admin_approve'
      end
    end

  end

  namespace :customer do

    get '/' => 'welcome#index'
    get 'user_detail' => 'welcome#user_detail'
    post 'sign_in' => 'welcome#log_in', as:'sign_in'
    get 'step_one' => 'welcome#mobile_number'
    post 'step_two' => 'welcome#otp'
    post 'step_three' => 'welcome#after_otp'
    get 'registration' => 'welcome#registration'
    post 'sign_up' => 'welcome#sign_up', as:'sign_up'
    get 'dashboard' => 'welcome#dashboard'
    get 'profile' => 'welcome#profile'
    put 'update_profile_image' => 'welcome#update_profile_image'
    put 'change_password_' => 'welcome#change_password_'
    put 'change_mobile' => 'welcome#change_mobile'
    delete 'sign_out_' => 'welcome#sign_out_'
    delete 'profile_image' => 'welcome#profile_image'


    resources :advertisements do
      resources :advertisement_images
    end

    resources :products do
      resources :product_images
    end

    resources :services do
      resources :service_images
    end

    resources :enquiries do
      member do
        put 'deal'
      end
    end

  end

  # Rahul
  get 'about_us' => 'welcome#about_us'
  # get 'subcategories' => 'welcome#subcategories', as:'subcategories'
  get 'product_detail' => 'welcome#product_detail'
  get 'contact_us' => 'welcome#contact_us'
  get 'listing_policy' => 'welcome#listing_policy'
  get 'terms_condition' => 'welcome#terms_condition'
  get 'privacy_policy' => 'welcome#privacy_policy'
  get 'faq' => 'welcome#faq'
  get 'blog' => 'welcome#blog'
  # Rahul

  get 'cities/collection_by_state/:id' => 'cities#collection_by_state', as:'collection_by_state'
  get 'get_subcategories/:id' => 'subcategories#get_subcategory'


  resources :subscribers

  resources :categories

  resources :subcategories

  resources :products do
    resources :enquiries
  end

  resources :services do
    resources :enquiries
  end

  resources :searches

  resources :cities

  resources :states

  get 'test' => 'welcome#test'


  # ==========Temp URL==============
  # ====== Must be delete ==========

  get 'barter/landing_page' => 'welcome#index'
  get 'barter/about' => 'welcome#about_us'

end
