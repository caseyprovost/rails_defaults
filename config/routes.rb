require "sidekiq/web"

def feature_enabled_for_user(feature_name, user)
  FeatureFlipper.new(user, $rollout).accessible_by_user?(feature_name, user)
end

Rails.application.routes.draw do
  namespace :admin do
    resources :users
    root to: "users#index"
  end

  devise_for :users, controllers: {
    sessions: "users/sessions",
    confirmations: "users/confirmations",
    passwords: "users/passwords",
    unlocks: "users/unlocks",
    registrations: "users/registrations"
    # omniauth_callbacks: "users/omniauth_callbacks"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  authenticate :user, ->(user) { feature_enabled_for_user(:custom_reports, user) } do
    mount Blazer::Engine, at: "blazer"
  end

  authenticate :user, ->(user) { feature_enabled_for_user(:bg_job_monitoring, user) } do
    mount Sidekiq::Web => "/sidekiq"
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # authenticated :user do
  # root to: "transactions#index", as: :authenticated_root
  # end

  devise_scope :user do
    unauthenticated :user do
      root to: "users/sessions#new"
    end
  end
end
