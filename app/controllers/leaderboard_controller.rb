class LeaderboardController < ApplicationController

  def index

  end

  def show
    @users = User.order('users.score DESC').all
  end
end
