
class StaticPagesController < ApplicationController
  
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end
  
  def contact
    flash[:success] = "Tu correo ha sido enviado con éxito."
  end

  def loading
    @escenario = Escenario.create(:id_escenario_ideal => '2', :id_user => current_user.id)
    #@id_escenario_ideal
    #Escenario.new(:id_escenario_ideal => '', :id_user => 'current_user.id')
    string = %x{ender.dacya.ucm.es/var/lib/one/crea.sh}
    #ender.dacya.ucm.es/var/lib/one/crea.sh
    if string.include? "FIN"
    flash[:success] = "Es escenario se ha desplegado con éxito. ¡Descárgate los 
    #{view_context.link_to("certificados", "/prueba.zip")}, y empieza a practicar!"
    #/prueba.zip
    ##{Rails.root}/var/lib/one/escenarios/ES002/ctr.zip
    end
  end
end