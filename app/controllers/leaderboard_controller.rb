class LeaderboardController < ApplicationController
  before_filter :authenticate_user!
  def index

  end

  def show
    @users = User.order('users.score DESC').all
  end
end
