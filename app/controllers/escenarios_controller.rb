class EscenariosController < ApplicationController
  before_action :set_escenario, only: [:show, :edit, :update, :destroy]
  #attr_accessible :id_escenario_ideal
  #has_one :escenario_ideal
  #has_many :maquina
  #belongs_to :user
  # GET /escenarios
  # GET /escenarios.json
  def index
    @escenarios = Escenario.all
  end

  # GET /escenarios/1
  # GET /escenarios/1.json
  def show
  end

  # GET /escenarios/new
  def new
    @escenario_ideal_id = params[:id_escenario_ideal] 
    @user_id = params[:current_user]
    @escenario_ideal_script = [:script]
    @escenario_ideal_mv = [:mv]
    @escenario = Escenario.create(:id_escenario_ideal => @escenario_ideal_id, :id_user => @user_id)
     #Que un usuario no pueda lanzar un escenario 2 veces
    #Mostrar escenario lanzado/no lanzado
    #@escenario = EscenarioIdeal.find(params[:id])
    #@current_escenario = Escenario.create(:id_escenario_ideal => @escenario_ideal.id, :id_user => current_user.id)
    #system('su oneadmin -c "/var/lib/one/crea.sh ES001 #{@escenario_ideal_script} #{@escenario_ideal_mv}&"')
    #system('su oneadmin -c "/var/lib/one/crea.sh ES001 2:1524:2 router.tmpl:victima.tmpl &"')
    #@id_escenario_ideal
    #Escenario.new(:id_escenario_ideal => '', :id_user => 'current_user.id')
    #string = %x{ender.dacya.ucm.es/var/lib/one/crea.sh}
    #ender.dacya.ucm.es/var/lib/one/crea.sh
    #if string.include? "FIN"
    #Mostrar el popup en la vista del escenario
    flash[:success] = "Es escenario se ha desplegado con éxito. ¡Descárgate los 
    #{view_context.link_to("certificados", "/prueba.zip")}, y empieza a practicar!"
    #/prueba.zip
    ##{Rails.root}/var/lib/one/escenarios/ES002/ctr.zip
    #end
  end

  # GET /escenarios/1/edit
  def edit
  end

  # POST /escenarios
  # POST /escenarios.json
  def create
    @escenario = Escenario.new(escenario_params)

    respond_to do |format|
      if @escenario.save
        format.html { redirect_to @escenario, notice: 'Escenario was successfully created.' }
        format.json { render :show, status: :created, location: @escenario }
      else
        format.html { render :new }
        format.json { render json: @escenario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /escenarios/1
  # PATCH/PUT /escenarios/1.json
  def update
    respond_to do |format|
      if @escenario.update(escenario_params)
        format.html { redirect_to @escenario, notice: 'Escenario was successfully updated.' }
        format.json { render :show, status: :ok, location: @escenario }
      else
        format.html { render :edit }
        format.json { render json: @escenario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /escenarios/1
  # DELETE /escenarios/1.json
  def destroy
    @escenario.destroy
    #respond_to do |format|
     # format.html { redirect_to escenarios_url, notice: 'Escenario was successfully destroyed.' }
      #format.json { head :no_content }
    #end
    flash[:success] = "Escenario parado con éxito"
    redirect_to escenario_ideals_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_escenario
      @escenario = Escenario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def escenario_params
      params.require(:escenario).permit(:id_escenario_ideal, :id_user)
    end
end
