Rails.application.routes.draw do
  post "auth" => "user_token#create"

  resource :users, only: [:create]

  resource :user, only: [:show, :update], path: "/users/me" do
    resources :homes do
      namespace :things do
        resources :lights do
          resource :status, only: [:show, :update], controller: "status/light"
        end

        resources :locks do
          resource :status, only: [:show, :update], controller: "status/lock"
        end

        resources :thermostats do
          resource :status, only: [:show, :update], controller: "status/thermostat"
        end

        resources :weathers
      end
    end
  end
end
