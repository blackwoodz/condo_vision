Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "units#index"
  # Routes for the Invoice resource:
  # CREATE
  get "/invoices/new", :controller => "invoices", :action => "new"
  post "/create_invoice", :controller => "invoices", :action => "create"

  # READ
  get "/invoices", :controller => "invoices", :action => "index"
  get "/invoices/:id", :controller => "invoices", :action => "show"

  # UPDATE
  get "/invoices/:id/edit", :controller => "invoices", :action => "edit"
  post "/update_invoice/:id", :controller => "invoices", :action => "update"

  # DELETE
  get "/delete_invoice/:id", :controller => "invoices", :action => "destroy"
  #------------------------------

  # Routes for the Tenancy resource:
  # CREATE
  get "/tenancies/new", :controller => "tenancies", :action => "new"
  post "/create_tenancy", :controller => "tenancies", :action => "create"

  # READ
  get "/tenancies", :controller => "tenancies", :action => "index"
  get "/tenancies/:id", :controller => "tenancies", :action => "show"

  # UPDATE
  get "/tenancies/:id/edit", :controller => "tenancies", :action => "edit"
  post "/update_tenancy/:id", :controller => "tenancies", :action => "update"

  # DELETE
  get "/delete_tenancy/:id", :controller => "tenancies", :action => "destroy"
  #------------------------------

  # Routes for the Ownership resource:
  # CREATE
  get "/ownerships/new", :controller => "ownerships", :action => "new"
  post "/create_ownership", :controller => "ownerships", :action => "create"

  # READ
  get "/ownerships", :controller => "ownerships", :action => "index"
  get "/ownerships/:id", :controller => "ownerships", :action => "show"

  # UPDATE
  get "/ownerships/:id/edit", :controller => "ownerships", :action => "edit"
  post "/update_ownership/:id", :controller => "ownerships", :action => "update"

  # DELETE
  get "/delete_ownership/:id", :controller => "ownerships", :action => "destroy"
  #------------------------------

  # Routes for the Payment resource:
  # CREATE
  get "/payments/new", :controller => "payments", :action => "new"
  post "/create_payment", :controller => "payments", :action => "create"

  # READ
  get "/payments", :controller => "payments", :action => "index"
  get "/payments/:id", :controller => "payments", :action => "show"

  # UPDATE
  get "/payments/:id/edit", :controller => "payments", :action => "edit"
  post "/update_payment/:id", :controller => "payments", :action => "update"

  # DELETE
  get "/delete_payment/:id", :controller => "payments", :action => "destroy"
  #------------------------------

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
