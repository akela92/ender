class EscenarioIdealsController < ApplicationController
  before_action :set_escenario_ideal, only: [:show, :edit, :update, :destroy]

  # GET /escenario_ideals
  # GET /escenario_ideals.json
  def index
    @escenario_ideals = EscenarioIdeal.all
  end

  # GET /escenario_ideals/1
  # GET /escenario_ideals/1.json
  def show
  end

  # GET /escenario_ideals/new
  def new
    @escenario_ideal = EscenarioIdeal.new
  end

  # GET /escenario_ideals/1/edit
  def edit
  end

  # POST /escenario_ideals
  # POST /escenario_ideals.json
  def create
    @escenario_ideal = EscenarioIdeal.new(escenario_ideal_params)

    respond_to do |format|
      if @escenario_ideal.save
        format.html { redirect_to @escenario_ideal, notice: 'Escenario ideal was successfully created.' }
        format.json { render :show, status: :created, location: @escenario_ideal }
      else
        format.html { render :new }
        format.json { render json: @escenario_ideal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /escenario_ideals/1
  # PATCH/PUT /escenario_ideals/1.json
  def update
    respond_to do |format|
      if @escenario_ideal.update(escenario_ideal_params)
        format.html { redirect_to @escenario_ideal, notice: 'Escenario ideal was successfully updated.' }
        format.json { render :show, status: :ok, location: @escenario_ideal }
      else
        format.html { render :edit }
        format.json { render json: @escenario_ideal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /escenario_ideals/1
  # DELETE /escenario_ideals/1.json
  def destroy
    @escenario_ideal.destroy
    respond_to do |format|
      format.html { redirect_to escenario_ideals_url, notice: 'Escenario ideal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_escenario_ideal
      @escenario_ideal = EscenarioIdeal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def escenario_ideal_params
      params.require(:escenario_ideal).permit(:nombre, :descipcion, :dificultad, :script_maquinas, :mv_array)
    end
end
