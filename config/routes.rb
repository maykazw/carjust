Rails.application.routes.draw do
  default_url_options :host => "http://localhost:3000"
  resources :offers, except: [:new,:edit] do
    get 'search', on: :collection
  end
  post 'attachments', to: 'attachments#create'
  delete 'attachments/:id', to: 'attachments#destroy'
end
