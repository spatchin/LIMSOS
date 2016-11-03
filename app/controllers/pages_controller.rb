class PagesController < ApplicationController
  def show
    current_user.update(active_ws: 0) if user_signed_in?
    if valid_page?
      render params[:page].to_s
    else
      render file: 'public/404.html', status: :not_found
    end
  end

  def enter_workspace
    unless user_signed_in?
      return redirect_to new_user_session_path, notice: 'You must be logged in to enter workspace'
    end
    current_user.update(active_ws: params[:ws])
    redirect_to rails_admin_path
  end

  private

  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.haml"))
  end
end
