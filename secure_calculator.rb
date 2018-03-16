require "sinatra"
require "sinatra/reloader"

def check_credentials(username, password)

	credentials = {"cheese" => "whiz", "smack" => "down", "lazer" => "breath"}
	credentials.each_pair do |key,value|
		if username == key && password == value
			return true
	 	end
	end
	return false
end


get "/" do
	message = "Please enter your first name, last name, username, and password."
	erb :welcome, locals: {message: message }

end




post "/login" do

	f_name = params[:f_name]
	l_name = params[:l_name]
	username = params[:username]
	password = params[:password]

	if check_credentials(username, password)
		redirect "/show?f_name=" + f_name + "&l_name=" + l_name + "&username=" + username + "&password=" + password
	else
		redirect "/retry?f_name=" + f_name + "&l_name=" + l_name
	end
	
end


get "/retry" do
	f_name = params[:f_name]
	l_name = params[:l_name]
	erb :retry, locals: {f_name: f_name, l_name: l_name}

end


get "/show" do
	f_name = params[:f_name]
	l_name = params[:l_name]
	username = params[:username]
	password = params[:password]
	message = "Nice job dumbas!!"
	erb :show, locals: {message: message, f_name: f_name, l_name: l_name}
end
