Rails.application.routes.draw do
  resources :comments, except: [:new, :edit]
  resources :posts, except: [:new, :edit]
  namespace :api, defaults: { format: :json } do
	  namespace :v1 do
			get 'index' => 'counters#index'
	  end
	end
end
