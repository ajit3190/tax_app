Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :home do 
  	collection do 
    	get :item_list
    	# put :display_bill
    	get :display_bill
    end
  end
  resources :item_categories
  resources :items
  resources :item_taxes
  root to: "home#index"
end
