class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
    render layout: "plain"
  end

  def create
    user = User.find_by(username: params[:username])
    if user
      if user.try(:authenticate, params[:password])
        puts "user authenticated"
        session[:user_id] = user.id
        session[:user_name] = user.username
        if user.role == 'admin'
          redirect_to admin_url
        else
          redirect_to notes_url
        end
      else
        redirect_to login_url, alert: "Incorrect username/password combination"
      end
    else
      redirect_to login_url, alert: "User does not exist"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, alert: "Logged out"
  end

  def forgot
    render layout: "plain"
  end

  def update_password
    username = params[:username]
    user = User.find_by(username: username)
    if user
      user.password = params[:password]
      if user.save
        redirect_to login_url, alert: "Password updated"
      end
    else
      redirect_to login_url, alert: "Incorrect username"
    end
  end
end
