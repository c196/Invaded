class InvadersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_invader, only: [:show, :edit, :update, :destroy]

  # GET /invaders
  # GET /invaders.json
  def index
    @invaders = Invader.all
  end

  # GET /invaders/1
  # GET /invaders/1.json
  def show
  end

  # GET /invaders/new
  def new
    @invader = Invader.new
  end

  # GET /invaders/1/edit
  def edit
  end

  def found
    @invader = Invader.find(params[:id])
    @temp_invader = TempInvader.new
  end

  def result

  end

  def lost_invader
    @invader = Invader.find(params[:id])
    @invader.update_attributes(:credibility => @invader.credibility - 10)
    @creator = User.find(@invader.users_id)
    @creator.update_attributes(:credibility => + 1)
    redirect_to invaders_result_path, notice: 'Invader Lost'
  end

  def createTemp
    @temp_invader = TempInvader.new(temp_invader_params.merge!(userId: current_user.id))
    if @temp_invader.save
      verify_image(@temp_invader)
      verify_location
      if $locationValid == true
          if $imageValid == true
            @invader = Invader.find(@temp_invader.invaderId)
            @temp_invader.destroy
            @user = current_user
            @invader.update_attributes(:credibility => @invader.credibility + 10)
            @user.update_attributes(:score => @user.score + 10)
            @creator = User.find(@invader.users_id)
            @creator.update_attributes(:score => @creator.score + 1, :credibility => + 1)
            redirect_to invaders_result_path, notice: 'Invasion Confirmed'
          else
            redirect_to invaders_result_path, notice: "Images don't match"
          end
      else
          redirect_to invaders_result_path, notice: 'To far away'
      end
    end
  end

  def verify_location
    invaderId = @temp_invader.invaderId
    @invader = Invader.find(invaderId)
    invaderLocation = @temp_invader.location.split(',').map(&:to_f)
    currentLocation = @invader.location.split(',').map(&:to_f)
    difference = invaderLocation[0] - currentLocation[0] + invaderLocation[1] - currentLocation[1]
    if difference.abs <= 0.001
      $locationValid = true
    else
      $locationValid = false
    end
  end

  def verify_image(temp)
    @invader = Invader.find(temp.invaderId)

    hash1 = Dhash.calculate(@invader.image.path)
    hash2 = Dhash.calculate(temp.image.path)

    if Dhash.hamming(hash1, hash2) < 20
      $imageValid = true
    else
      $imageValid = false
    end
  end

  # POST /invaders
  # POST /invaders.json
  def create
    @invader = Invader.new(invader_params.merge!(users_id: current_user.id, credibility: '500', username: current_user.user_name))

    respond_to do |format|
      if @invader.save
        format.html { redirect_to @invader, notice: 'Invader was successfully created.' }
        format.json { render :show, status: :created, location: @invader }
      else
        format.html { render :new }
        format.json { render json: @invader.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invaders/1
  # PATCH/PUT /invaders/1.json
  def update
    respond_to do |format|
      if @invader.update(invader_params)
        format.html { redirect_to @invader, notice: 'Invader was successfully updated.' }
        format.json { render :show, status: :ok, location: @invader }
      else
        format.html { render :edit }
        format.json { render json: @invader.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invaders/1
  # DELETE /invaders/1.json
  def destroy
    @invader.destroy
    respond_to do |format|
      format.html { redirect_to play_hub_path, notice: 'Invader was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # PATCH/PUT /invaders/1
  # PATCH/PUT /invaders/1.json


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invader
      @invader = Invader.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invader_params
      params.require(:invader).permit(:name, :description, :hints, :location, :users_id, :accuracy, :credibility, :image, :username)
    end

    def temp_invader_params
      params.require(:temp_invader).permit(:location, :invaderId, :image)
    end
end
