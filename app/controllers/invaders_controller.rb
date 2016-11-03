class InvadersController < ApplicationController
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

  # POST /invaders
  # POST /invaders.json
  def create
    @invader = Invader.new(invader_params)

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
      format.html { redirect_to invaders_url, notice: 'Invader was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invader
      @invader = Invader.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invader_params
      params.fetch(:invader, {})
    end
end
