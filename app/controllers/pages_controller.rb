class PagesController < ApplicationController
  before_action :authenticate_user!

  def show
    current_user.update(active_ws: 0) if user_signed_in?
    if valid_page?
      render params[:page].to_s
    else
      render file: 'public/404.html', status: :not_found
    end
  end

  def enter_workspace
    current_user.update(active_ws: params[:ws])
    redirect_to rails_admin_path
  end

  private

  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.haml"))
  end
end
