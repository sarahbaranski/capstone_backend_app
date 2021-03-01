Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post "/students" => "students#create"
    post "/sessions" => "sessions#create"
    get "/semesters" => "semesters#index"
    post "/shifts" => "shifts#create"
  end
end
