require 'sidekiq/web'

Certificados::Application.routes.draw do

  resources :validations, :only => [:new, :create, :show]

  resources :certificates, :only => [] do
    get :autocomplete_certificate_uuid, :on => :collection
  end

  get "students/imports/new" => "students#new_import", :as => :new_students_import
  post "students/imports" => "students#create_import", :as => :students_import
  get "lecturers/imports/new" => "lecturers#new_import", :as => :new_lecturers_import
  post "lecturers/imports" => "lecturers#create_import", :as => :lecturers_import
  post "certificates/:certificate_id/mail/" => "certificate_mail#create", :as => :email_certificate
  get "certificates/search/" => "certificates#search", :as => :search_certificates
  get "certificates/" => "certificates#index", :as => :certificates
  get "certificates/filter" => "certificates#filter", :as => :filter_certificates


  [:lecturers, :students].each do |r|
    resources r do
      resources :certificates, :except => [:edit, :update, :index], :shallow => true do
        resources :send_attempts, :only => [:index], :shallow => true
      end
    end
  end

  resource :validation, :only => [:new, :create], :shallow => true

  mount Sidekiq::Web, at: "/sidekiq"
  root :to => "certificates#index"
end
