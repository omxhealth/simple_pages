SimplePages::Engine.routes.draw do
  match "*id" => "pages#show", as: :page
  root to: "pages#show"
end
