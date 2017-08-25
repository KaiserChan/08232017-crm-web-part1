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
  @contacts = Contact.find_by(id: params[:id].to_i)
  if @contacts
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
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
