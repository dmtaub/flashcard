Rails.application.routes.draw do
  root 'welcome#index'

  post :reset_bins, to: "wordcards#reset"
  resources :wordcards do
  	post :result
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
