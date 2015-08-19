# Create a new sinatra app called sinatra_blog and add a 
# database to the app using the steps specified in class. 
# Add a users table to the database with the following
# fields: email and full_name. Then create a User model in 
# the app that can be used to create (read, update or delete)
#  new user records using activerecord. The assignment will be 
# considered complete when you are able to succesfully create 
# new users in IRB (as specified in class). 

require 'sinatra'
require 'sinatra/activerecord'
set :database, "sqlite3:marina.sqlite3"

require './models'

get '/' do 
	erb :homework5_home
end
get '/signup' do 
	erb :signup
end
post '/signup' do 
	User.create(params)
	puts "my params are" + params.inspect 
	
end
get '/thanks' do
	erb :thankyou
end
get '/edit' do
	erb :edit
end

post '/edit' do 
	user = User.find(params[:id])
	user.first_name = params[:first_name]
	user.save		
end



# post '/sign_in' do
# 	@user = User.where(username: params[:username]).first
# 		if @user.password == params[:password]
# 			redirect '/'
# 		else
# 			redirect '/login-failed'
# 		end
# 	end