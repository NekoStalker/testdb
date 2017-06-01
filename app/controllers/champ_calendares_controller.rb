class ChampCalendaresController < ApplicationController
  before_action :set_champ_calendare, only: [:show, :edit, :update, :destroy]
  skip_before_action :check_ctr_auth, only: [:new, :create]
  skip_before_filter :require_login, :only => [:new, :create]

  # GET /champ_calendares
  # GET /champ_calendares.json
  def index
    @champ_calendares = ChampCalendare.all
  end

  # GET /champ_calendares/1
  # GET /champ_calendares/1.json
  def show
  end

  # GET /champ_calendares/new
  def new
    @champ_calendare = ChampCalendare.new
  end

  # GET /champ_calendares/1/edit
  def edit
  end

  # POST /champ_calendares
  # POST /champ_calendares.json
  def create
    @champ_calendare = ChampCalendare.new(champ_calendare_params)

    respond_to do |format|
      if @champ_calendare.save
        format.html { redirect_to @champ_calendare, notice: 'Календарь успешно создан.' }
        format.json { render :show, status: :created, location: @champ_calendare }
      else
        format.html { render :new }
        format.json { render json: @champ_calendare.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /champ_calendares/1
  # PATCH/PUT /champ_calendares/1.json
  def update
    respond_to do |format|
      if @champ_calendare.update(champ_calendare_params)
        format.html { redirect_to @champ_calendare, notice: 'Календарь успешно обновлен.' }
        format.json { render :show, status: :ok, location: @champ_calendare }
      else
        format.html { render :edit }
        format.json { render json: @champ_calendare.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /champ_calendares/1
  # DELETE /champ_calendares/1.json
  def destroy
    @champ_calendare.destroy
    respond_to do |format|
      format.html { redirect_to champ_calendares_url, notice: 'Календарь успешно удален.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_champ_calendare
      @champ_calendare = ChampCalendare.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def champ_calendare_params
      params.require(:champ_calendare).permit(:champ_name, :numb, :start_date, :country, :place)
    end
 def check_ctr_auth()
      case action_name.to_sym
      when :show
        if @current_role_user.try(:is_admin?)
          return true
        end
        if @current_role_user.try(:is_operator?)
          return true
        end
      when :index
        if @current_role_user.try(:is_admin?)
          return true
        end
        if @current_role_user.try(:is_operator?)
          return true
        end
      when :new
        if @current_role_user.try(:is_admin?)
          return true
        end
        if @current_role_user.try(:is_operator?)
          return false
        end
      when :create
        if @current_role_user.try(:is_admin?)
          return true
        end
        if @current_role_user.try(:is_operator?)
          return false
        end
      when :edit
        if @current_role_user.try(:is_operator?)
          return false
        end
        if @current_role_user.try(:is_admin?)
          return true
        end
      when :destroy
        if @current_role_user.try(:is_operator?)
          return false
        end
        if @current_role_user.try(:is_admin?)
          return true
        end
      else
        if @current_role_user.try(:is_operator?)
          return false
        end
        if @current_role_user.try(:is_admin?)
          return true
        end
      end
   end
end
