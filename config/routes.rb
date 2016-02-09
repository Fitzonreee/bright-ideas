Rails.application.routes.draw do

  get 'ideas/index'

    # users Routes
    root 'users#index'
    post 'register' => 'users#create'
    post 'login' => 'users#login'
    get 'logout' => 'users#logout'

    # bright_ideas Routes
    get 'bright_ideas' => 'ideas#index'
    post 'add' => 'ideas#create'
    post 'like/:id' => 'ideas#like'
    post 'delete/:id' => 'ideas#destroy'

    get 'bright_ideas/:id' => 'ideas#liked_by'
    get 'users/:id' => 'ideas#profile'

end
