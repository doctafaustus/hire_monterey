class JobsController < ApplicationController
  
  def index

    @search = Job.search(params[:q])
    @results = @search.result
    @results = @results.where("created_at > ?", Time.now - 60.days)
    @jobs = @results.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    # Date Posted Labels
    @oneday_y = Time.now - 1.days
    @oneday_x = "q[created_at_gt]_" + @oneday_y.to_s

    @oneweek_y = Time.now - 7.days
    @oneweek_x = "q[created_at_gt]_" + @oneweek_y.to_s

    @twoweeks_y = Time.now - 14.days
    @twoweeks_x = "q[created_at_gt]_" + @twoweeks_y.to_s

    @onemonth_y = Time.now - 30.days
    @onemonth_x = "q[created_at_gt]_" + @onemonth_y.to_s

    @anytime_y = Time.now - 365.days
    @anytime_x = "q[created_at_gt]_" + @anytime_y.to_s

  end

  def new
    @job = Job.new
    
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def create
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
      # Set your secret key: remember to change this to your live secret key in production
      # See your keys here https://manage.stripe.com/account
      Stripe.api_key = "sk_live_QEKHJV4CMEOLQcQrmY8XdNjO"

      # Get the credit card details submitted by the form
      token = params[:stripeToken]

      # Create a Customer
      customer = Stripe::Customer.create(
        :email => @current_user.email,
        :card => token,
        :description => "60-Day Job Listing"
      )

      # Charge the Customer instead of the card
      Stripe::Charge.create(
          :amount => 50, # in cents
          :description => '60-Day Job Listing',
          :currency => "usd",
          :customer => customer.id
      )

  	@job = Job.new(params[:job])
  	@job.save

  	redirect_to '/myjobs/all'
  end

  def show
  	@job = Job.find(params[:id])
  end

  def home
    @search = Job.search(params[:q])
    @intropage = true

  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])


    if @job.update_attributes(params[:job])
      redirect_to @job
    else
      render 'edit'
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to '/myjobs/all'
  end
end
