Rails.application.routes.draw do
  resources :projects do
    member do
      get 'show_cached'
      get 'show_cached_with_needs'
      get 'show_uncached'
      get 'cannot_cache'
    end
  end
end
