Dummy::Application.routes.draw do
  resources :i18n_simple_pages
  match "*id" => "simple_pages#show"

  root to: "simple_pages#show"
end
