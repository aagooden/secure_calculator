require "sinatra"

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
		message = "You have a successful login."
		redirect "/calculator?f_name=" + f_name + "&l_name=" + l_name + "&message=" + message
	else
		redirect "/retry?f_name=" + f_name + "&l_name=" + l_name
	end
	
end


get "/retry" do
	f_name = params[:f_name]
	l_name = params[:l_name]
	message = params[:message]
	erb :retry, locals: {f_name: f_name, l_name: l_name, message: message}

end


get "/calculator" do
	f_name = params[:f_name]
	l_name = params[:l_name]
	username = params[:username]
	password = params[:password]
	message = params[:message]
	erb :calculator, locals: {message: message, f_name: f_name, l_name: l_name}
end


post "/show" do
	f_name = params[:f_name]
	l_name = params[:l_name]
	username = params[:username]
	password = params[:password]
	num1 = params[:num1].to_f
	num2 = params[:num2].to_f
	operation = params[:operation]
	message = "Let's do it again..."


	if num2.to_f == 0 && operation == "/"
		result = "Zero Division Error"
	elsif operation == "+"
		result = num1.to_f +  num2.to_f
	elsif operation == "-"
		result = num1.to_f - num2.to_f
	elsif operation == "*"
		result = num1.to_f * num2.to_f
	elsif operation == "/"
		result = num1.to_f / num2.to_f
	end
	
	erb :show, locals: { f_name: f_name, l_name: l_name, num1: num1, num2: num2, operation: operation, result: result, message: message}
end














