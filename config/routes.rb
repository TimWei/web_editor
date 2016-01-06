Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'page#index'
   get '/' => 'page#index', as: "page_index"
   get '/edit' => 'page#file_edit', as: "file_edit" 
   post '/preview' => 'page#file_preview', as: "file_preview"
   post '/save' => 'page#file_save', as: "file_save"
  
end
