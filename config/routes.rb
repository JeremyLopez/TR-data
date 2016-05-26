Rails.application.routes.draw do
	
  resources :patents do
		collection { post:import }
	end
	
	resources :cond_pharmas do
		collection { post:import }
	end
	
  resources :products
#	get 'products_ajax/datatable_ajax', to: 'products#datatable_ajax' 
	
	post '/drugs', to: 'drugs#index_table'
	post '/pharmacologies', to: 'pharmacologies#index_table'
	post '/finalData', to: 'drugs#finalData'
	
	resources :drugs do 
		collection { post:import }
	end
	
	resources :pharmacologies do 
		collection { post:import }
	end
	
	root 'static_pages#home'
	
	get '*path', to: 'static_pages#home'
end
