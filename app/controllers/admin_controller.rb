class AdminController < ApplicationController
  before_action :check_role, only: :index
  def index
    @total_notes_count = Note.count
    @total_users_count = User.count
    @total_categories_count = Category.count
    render layout: "admin"
  end

  def forbidden

  end

  private
    def check_role
      current_user = User.find_by(id: session[:user_id])
      if current_user.role != 'admin'
        redirect_to forbidden_url
      end
    end
end
