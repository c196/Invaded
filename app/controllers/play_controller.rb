class PlayController < ApplicationController
  before_action :authenticate_user!
  def hub
  end
end
