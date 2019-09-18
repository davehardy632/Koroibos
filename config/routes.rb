Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/olympians', to: "olympians#index"
      get '/olympian', to: "olympians#show"
      get '/olympian_stats', to: "olympian_stats#index"
      get '/events', to: "events#index"
      get '/events/:id/medalists', to: "medalists#index"
      get '/sports/:id/competitors', to: "competitors#index"
      get '/medal_count', to: "medal_count#index"
      get '/top_ten_olympians', to: "top_ten_olympians#index"
    end
  end

  get '/', to: "edge_case#index"
  get '/api/v1', to: "edge_case#index"
  get '/api', to: "edge_case#index"
end
