Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "units#index"
  # Routes for the Unit resource:
  # CREATE
  get "/units/new", :controller => "units", :action => "new"
  post "/create_unit", :controller => "units", :action => "create"

  # READ
  get "/units", :controller => "units", :action => "index"
  get "/units/:id", :controller => "units", :action => "show"

  # UPDATE
  get "/units/:id/edit", :controller => "units", :action => "edit"
  post "/update_unit/:id", :controller => "units", :action => "update"

  # DELETE
  get "/delete_unit/:id", :controller => "units", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
