Rails.application.routes.draw do
  resources :patents do
		collection { post:import }
	end
	
	resources :cond_pharmas do
		collection { post:import }
	end
	
  resources :products
	get 'products_ajax/datatable_ajax', to: 'products#datatable_ajax' 
	
	resources :pharmacologies do 
		collection { post:import }
	end
	
	post '/drugs/sort', to: 'drugs#index'
	
	resources :drugs do 
		collection { post:import }
	end
	
	root 'static_pages#home'
end
