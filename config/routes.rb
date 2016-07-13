Rails.application.routes.draw do
  root "makes#index"

  get "/show" => "makes#show"
end
