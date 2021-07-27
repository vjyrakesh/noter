class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
    render layout: "plain"
  end

  def create
    user = User.find_by(username: params[:username])
    puts user.username
    puts user.password_digest
    puts user.role
    if user.try(:authenticate, params[:password])
      puts "user authenticated"
      session[:user_id] = user.id
      if user.role == 'admin'
        redirect_to admin_url
      else
        redirect_to notes_url
      end
    else
      puts "user not authenticated"
      redirect_to login_url, alert: "Incorrect username/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, alert: "Logged out"
  end
end
