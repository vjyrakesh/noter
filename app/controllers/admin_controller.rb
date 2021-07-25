class AdminController < ApplicationController
  before_action :check_role, only: :index
  def index
    @total_notes_count = Note.count
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
