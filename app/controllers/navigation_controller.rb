class NavigationController < ApplicationController
  def start
    redirect_to login_path
  end
end
