Rails.application.routes.draw do
  scope module: :public do
    root 'homes#top'
    get 'about' => "homes#about"
    get 'end_users/users' => 'end_users#show', as: 'user_page'
    get 'end_users/users/index' => 'end_users#index', as: 'user_index'
    # end_users/editのようにするとdeviseのルーティングとかぶってしまうためinformationを付け加えている。
    get 'end_users/information/edit' => 'end_users#edit', as: 'edit_information'
    patch 'end_users/information' => 'end_users#update', as: 'update_information'
  end
  devise_for :end_users, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations',
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
