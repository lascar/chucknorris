Rails.application.routes.draw do
  root to: 'chucks#index'
  scope "/:locale", locale: /#{I18n.available_locales.join("|")}/ do
    get '/chucks', to: 'chucks#index'
    get '/chucks/random', to: 'chucks#random', as: 'random'
    get '/chucks/search', to: 'chucks#search', as: 'search'
    post '/chucks/search_results', to: 'chucks#search_results', as: 'search_results'
  end
end
