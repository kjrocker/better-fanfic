Rails.application.routes.draw do
  scope '/api' do
    scope module: :v1 do
      post 'user_token' => 'user_token#create'
      resources :users, only: [:create, :update, :show]

      resources :stories do
        resources :chapters, only: [:index, :create]
      end

      resources :chapters, except: [:index, :create]

      post 'chapter_preview' => "chapter_previews#create"
    end
  end

  get '*path', to: "application#fallback_index_html", constraints: -> (request) do
    !request.xhr? && request.format.html?
  end
end
