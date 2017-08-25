require_relative 'contact'
require 'sinatra'

get '/' do
  erb :index
end

get '/index' do
  redirect to('/')
end

get '/new' do
  redirect to('/contacts/new')
end

get '/contacts/new' do
  erb :new
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

post '/contacts' do
  Contact.create(
  first_name: params[:first_name],
  last_name:  params[:last_name],
  email:      params[:email],
  note:       params[:note]
  )
  redirect to('/contacts')
end

get '/contacts/:id/edit' do
  erb :edit_contact
end


after do
  ActiveRecord::Base.connection.close
end
