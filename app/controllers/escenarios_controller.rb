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
    #@ruta="su oneadmin -c \"/var/lib/one/validacion.sh "+@escenario.id.to_s+" &\""
    #if system(@ruta) == true
     # flash[:success] = "¡Escenario superado! #{view_context.link_to("Volver al escenario.", @escenario)}" 
    #else
      #flash[:danger] = "Lo sentimos, pero tu fichero no es correcto."
    #end
  end

  # Comprueba que el fichero que sube el usuario es igual que el del escenario ideal
  def comprobar
    
  end

  # GET /escenarios/new
   def new
    @escenario_ideal_id = params[:id_escenario_ideal] 
    @user_id = params[:current_user]
    @escenario_ideal_script = params[:script]
    @escenario_ideal_mv = params[:mv]
    if !Escenario.exists?(id_escenario_ideal: @escenario_ideal_id, id_user: @user_id)
      @escenario = Escenario.create(:id_escenario_ideal => @escenario_ideal_id, :id_user => @user_id)
   # if !des=File.exist?("/var/lib/one/escenarios/"+@escenario.id.to_s+"")
      @ruta="su oneadmin -c \"/var/lib/one/crea.sh "+@escenario.id.to_s+" "+@escenario_ideal_script+" "+@escenario_ideal_mv+" &\""
      system(@ruta)
    else
      @escenario=Escenario.find_by(id_escenario_ideal: @escenario_ideal_id, id_user: @user_id )
    end
    
     #system(@ruta)
   
    if @escenario.estado.to_s == "exito"
    flash[:success] = "Es escenario se ha desplegado con éxito. ¡Descárgate los 
    #{view_context.link_to("certificados", "/certificados/"+@escenario.id.to_s+".zip")}, y empieza a practicar!"
    flash[:info] = "#{view_context.link_to("Volver al escenario.", @escenario)}" 
    end
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
    #respond_to do |format|
    if @escenario.update(escenario_params)
        @ruta="su oneadmin -c \"/var/lib/one/validacion.sh "+@escenario.id.to_s+" \""
	      system(@ruta) 
	      @escenario=Escenario.find_by(id: @escenario.id )
	      if @escenario.estado.to_s == "sup"
        	flash[:success] = "¡Escenario superado! " #{view_context.link_to("Volver al escenario.", @escenario)}" 
    		  @ruta="su oneadmin -c \"/var/lib/one/cierre.sh "+@escenario.id.to_s+" &\""
      		system(@ruta)
      		redirect_to escenario_ideals_url
	      else
        	flash[:danger] = "Lo sentimos, pero tu fichero no es correcto."
		      redirect_to @escenario
        end 
        #format.html { redirect_to @escenario, notice: 'Escenario was successfully updated.' }
        #format.json { render :show, status: :ok, location: @escenario }
      #else
       # format.html { render :edit }
        #format.json { render json: @escenario.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /escenarios/1
  # DELETE /escenarios/1.json
  def destroy
    @escenario.destroy
     @ruta="su oneadmin -c \"/var/lib/one/cierre.sh "+@escenario.id.to_s+" &\""
      system(@ruta)
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
      params.require(:escenario).permit(:id_escenario_ideal, :id_user, :fichero)

    end
end
