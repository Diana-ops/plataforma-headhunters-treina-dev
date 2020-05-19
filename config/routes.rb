Rails.application.routes.draw do
     
	devise_for :users, controllers: {
        	sessions: 'users/sessions',
		registrations: 'users/registrations'
        }

	devise_for :headhunters, controllers: {
        	sessions: 'headhunters/sessions',
		registrations: 'headhunters/registrations'
        }

  	root to: 'home#index'
	resources :job_opportunities do
		resources :apply_jobs, only: [:show, :new, :create, :edit, :update, :destroy] do
			resources :feedbacks, only: [:new, :create, :edit, :update]
			get "profile_as", to: "candidates#profile_as"
		end
	end

	resources :apply_jobs, only: [:index]

	resources :candidates do
		resources :comments, only: [:new, :create, :edit, :update, :destroy]
		resources :proposals do
			resources :awnser_proposals
		end
	end	
end
