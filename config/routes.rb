# Reference -> /quotes/{SEARCH_TAG}
Rails.application.routes.draw do
  resource :quotes, only: [:show]
  resource :tokens, only: [:create]
end
