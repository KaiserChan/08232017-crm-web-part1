require_relative 'contact'
require 'sinatra'

get '/' do
  erb :index
end

get '/index' do
  redirect to('/')
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

get '/contacts/:id' do
  params[:id]
  @contacts = Contact.find_by({id: params[:id].to_i})
  erb :show_contact
end

get '/about' do
  erb :about
end

get '/add_contact' do
  erb :add_contact
end

after do
  ActiveRecord::Base.connection.close
end
