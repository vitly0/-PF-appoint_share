Rails.application.routes.draw do
  namespace :public do
    get 'end_user/worked'
  end
  scope module: :public do
    root 'homes#top'
    get 'about' => "homes#about"
    get 'end_users/users/:id' => 'end_users#show', as: 'user_page'
    get 'end_users/users' => 'end_users#index', as: 'user_index'
    get 'end_users/users/index/:id' => 'end_users#schedule_index', as: 'user_schedule'
    # end_users/editのようにするとdeviseのルーティングとかぶってしまうためinformationを付け加えている。
    get 'end_users/information/edit/:id' => 'end_users#edit', as: 'edit_information'
    patch 'end_users/information' => 'end_users#update', as: 'update_information'
    patch 'end_users/users' => 'end_users#worked', as: 'update_worked'
    resources :schedules, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
      resources :schedule_comments, only: [:create, :destroy]
    end
  end
  devise_for :end_users, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations',
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
