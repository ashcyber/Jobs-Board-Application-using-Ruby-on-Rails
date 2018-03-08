Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'
  post '/', to: 'home#contact_us'
  post '/view_details', to: 'home#view_details'
  get '/view_details', to: 'home#view_details'
  post '/jobs', to: 'home#view_job_index'
  get '/upload_resume', to: 'candidate#new'
  post '/upload_resume', to: 'candidate#create'
  get '/hire_talent',   to: 'company#new'
  post '/hire_talent',  to: 'company#create'
  get '/jobs', to: 'home#jobs_index'
  get '/services', to: 'home#services'
  get '/about', to: 'home#about'
end

