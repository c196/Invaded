class PlayController < ApplicationController
  before_filter :authenticate_user!
  def hub
  end
  def tutorial
  end
  def settings
  end
end
