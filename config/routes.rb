Rails.application.routes.draw do
  get 'contacts/new'

  post 'contacts/create'

  get 'contacts/update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
