Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }, path_names: {
  sign_up: '',
  edit: '',
  password: '',
  cancel: ''
}

  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy'
    authenticated :user do
      root 'about#index', as: :authenticated_root
      resources :about, only: [:index]
      resources :images, only: [:index, :create, :new]
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
