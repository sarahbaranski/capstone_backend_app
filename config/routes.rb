Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post "/students" => "students#create"
    post "/sessions" => "sessions#create"
    get "/semesters" => "semesters#index"
    get "/shifts" => "shifts#index"
    post "/shifts" => "shifts#create"
    patch "/shifts/:id" => "shifts#update"
  end
end
