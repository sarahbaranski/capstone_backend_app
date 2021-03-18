Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post "/students" => "students#create"
    post "/sessions" => "sessions#create"
    get "/semesters" => "semesters#index"
    post "/semesters" => "semesters#create"
    get "/semesters/:id" => "semesters#show"
    get "/shifts" => "shifts#index"
    post "/shifts" => "shifts#create"
    post "/shifts_all" => "shifts#create_all"
    get "/shifts/:id" => "shifts#show"
    patch "/shifts/:id" => "shifts#update"
    get "/shift_requests" => "shift_requests#create"
    patch "/shift_requests/:id" => "shift_requests#update"
    delete "/shift_requests/:id" => "shift_requests#destroy"
    post "/shift_requests_all" => "shift_requests#create_all"
  end
end
