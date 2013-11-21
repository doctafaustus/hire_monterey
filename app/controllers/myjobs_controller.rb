class MyjobsController < ApplicationController
  def all
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @jobs = Job.all
  end

  def privacy
  end

  def about
  end

  def contact
  end

  def terms
  end
end
