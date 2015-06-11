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
    @escenario_ideal = EscenarioIdeal.find(params[:id])

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
        flash[:success] = "El escenario se ha creado con éxito."
        format.html { redirect_to @escenario_ideal, notice: 'Escenario ideal was successfully created.' }
        format.json { render :show, status: :created, location: @escenario_ideal }
      else
        flash[:danger] = "El escenario no se ha podido crear."
        format.html { render :new }
        format.json { render json: @escenario_ideal.errors, status: :unprocessable_entity }
      end
    end
  end
 
  # PATCH/PUT /escenario_ideals/1
  # PATCH/PUT /escenario_ideals/1.json
  def update
    if @escenario_ideal.update_attributes(escenario_ideal_params)
      flash[:success] = "Escenario actualizado con éxito"
      redirect_to @escenario_ideal
    else
      render 'edit'
    end
  end

  # DELETE /escenario_ideals/1
  # DELETE /escenario_ideals/1.json
  def destroy

    EscenarioIdeal.find(params[:id]).destroy
    flash[:success] = "Escenario eliminado con éxito"
    redirect_to escenario_ideals_url
   
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_escenario_ideal
      @escenario_ideal = EscenarioIdeal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def escenario_ideal_params
      params.require(:escenario_ideal).permit(:nombre, :descripcion, :dificultad, :script_maquinas, :mv_array, :picture)
    end
end
