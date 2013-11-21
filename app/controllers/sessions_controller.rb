class SessionsController < ApplicationController
def new
end

def create
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect_to '/myjobs/all', :flash => { :error => "Logged in!" } # Using 'error' so I can use the flash_error div id
  else
    flash.now.alert = "Invalid email or password"
    render "new"
  end
end

def destroy
  session[:user_id] = nil
  redirect_to root_url, :notice => "Logged out!"
end
end
