class UsersController < ApplicationController
def new
  @user = User.new
end

def create
  @user = User.new(params[:user])
  if @user.save
  	session[:user_id] = @user.id
    redirect_to '/myjobs/all', :flash => { :error => "Signed up!" } # Using 'error' so I can use the flash_error div id
  else
  	if @user.errors.any?
  	flash.now.alert =  for message in @user.errors.full_messages 
                 message
             end
    render "new"
  		end
	end
end

def current_user_jobs
end

end