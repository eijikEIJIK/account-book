Rails.application.routes.draw do
  get 'analysis/show'

  get '/'=>'home#index'
  get 'new' => 'home#new'
  post 'create' => 'home#create'

  get '/:id/edit'=>'home#edit'
  get '/:id/destroy'=>'home#destroy'
  post '/:id/update'=>'home#update'

  get 'analysis/show'=>'analysis#show'
  get 'analysis/payment'=>'analysis#payment'
  get 'analysis/income'=>'analysis#income'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
