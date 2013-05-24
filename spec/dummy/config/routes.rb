Dummy::Application.routes.draw do
  match "/custom_pages/*id" => "custom_pages#show"
  match "/pt/*id" => "custom_pages#show"

  mount SimplePages::Engine => "/"
end
