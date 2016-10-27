class WelcomeController < ApplicationController
  before_filter :sign_out
  def index
  end
end
