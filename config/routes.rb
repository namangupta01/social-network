Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  # namespace :api do
  #   namespace :v1 do
  #
  #   end
  # end
  #


  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      match '/likes' => 'likes_api#toggle_like', via: [:post]
      match '/posts' => 'posts_api#create', via: [:post]
      match '/timeline' => 'timeline_api#index', via: [:get]
      match '/login' => 'users_api#login', via: [:post]
      match '/follow' => 'user_actions_api#toggle_follow', via: [:post]
      # match '/likes': 'likes_api#cors_preflight_check', via: [:options]
    end
  end

end
