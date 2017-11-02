class WelcomeController < ApplicationController
  def index
    flash[:notice] = "sss"
  end
end
