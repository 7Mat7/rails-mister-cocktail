Rails.application.routes.draw do
  root to: 'cocktails#index'
  get 'cocktails', to:'cocktails#index', as:'cocktails'
  post 'cocktails', to:'cocktails#create'
  get 'cocktails/new', to:'cocktails#new', as:'new_cocktail'
  get 'cocktails/:id', to:'cocktails#show', as:'cocktail'
  get 'cocktails/:cocktail_id/doses/new', to:'doses#new', as: 'new_cocktail_dose'
  post 'cocktails/:cocktail_id/doses', to:'doses#create', as: 'cocktail_doses'
  delete 'cocktails/:id', to: 'cocktails#destroy'
  delete 'doses/:id', to: 'doses#destroy', as: 'dose'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
