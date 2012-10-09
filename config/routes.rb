Certificados::Application.routes.draw do

  get "students/imports/new" => "students#new_import", :as => :new_students_import
  post "students/imports" => "students#create_import", :as => :students_import
  get "lecturers/imports/new" => "lecturers#new_import", :as => :new_lecturers_import
  post "lecturers/imports" => "lecturers#create_import", :as => :lecturers_import
  post "certificates/:certificate_id/mail/" => "certificate_mail#create", :as => :email_certificate
  post "certificates/search/" => "certificates#search", :as => :search_certificates
  get "certificates/" => "certificates#index", :as => :certificates
  post "certificates/filter" => "certificates#filter", :as => :filter_certificates

  [:lecturers, :students].each do |r|
    resources r do
      resources :certificates, :except => [:edit, :update, :index], :shallow => true do
        resources :send_attempts, :only => [:index], :shallow => true
      end
    end
  end

  root :to => "certificates#index"
end
