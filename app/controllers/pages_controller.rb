class PagesController < ApplicationController
  def home
      if logged_in?
        redirect_to children_path
      else
        redirect_to login_path
      end
  end
end
