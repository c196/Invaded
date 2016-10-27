class PlayController < ApplicationController
  before_filter :authenticate_user!
  def hub
  end
end
