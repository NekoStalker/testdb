class ChampRacersController < ApplicationController
  before_action :set_champ_racer, only: [:show, :edit, :update, :destroy]
  def search
    if params.has_key?('search')
      @champ_racers = ChampRacer.search(params['search'])
    else
      @champ_racers = []
    end
    params['search'] ||= {}
  end
  # GET /champ_racers
  # GET /champ_racers.json
  def index
    @champ_racers = ChampRacer.all
  end

  # GET /champ_racers/1
  # GET /champ_racers/1.json
  def show
  end

  # GET /champ_racers/new
  def new
    @champ_racer = ChampRacer.new
  end

  # GET /champ_racers/1/edit
  def edit
  end

  # POST /champ_racers
  # POST /champ_racers.json
  def create
    @champ_racer = ChampRacer.new(champ_racer_params)

    respond_to do |format|
      if @champ_racer.save
        format.html { redirect_to @champ_racer, notice: 'Champ racer was successfully created.' }
        format.json { render :show, status: :created, location: @champ_racer }
      else
        format.html { render :new }
        format.json { render json: @champ_racer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /champ_racers/1
  # PATCH/PUT /champ_racers/1.json
  def update
    respond_to do |format|
      if @champ_racer.update(champ_racer_params)
        format.html { redirect_to @champ_racer, notice: 'Champ racer was successfully updated.' }
        format.json { render :show, status: :ok, location: @champ_racer }
      else
        format.html { render :edit }
        format.json { render json: @champ_racer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /champ_racers/1
  # DELETE /champ_racers/1.json
  def destroy
    @champ_racer.destroy
    respond_to do |format|
      format.html { redirect_to champ_racers_url, notice: 'Champ racer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_champ_racer
      @champ_racer = ChampRacer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def champ_racer_params
      params.require(:champ_racer).permit(:fn, :sn, :b_date, :country, :win_rate)
    end
end
