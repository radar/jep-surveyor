Rails.application.routes.draw do
  get 'survey/index'
  get 'survey/show'
  get 'survey/create'
  get 'survey/update'
  get 'survey/destroy'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  resources :rating_questions
  root "rating_questions#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
