
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
    string = %x{/home/iratxe/Documentos/ender/app/assets/hola.sh}
    if string.include? "ESCENARIO DESPLEGADO CON EXITO"
    flash[:success] = "Es escenario se ha desplegado con éxito. ¡Descárgate los 
    #{view_context.link_to("certificados", "#{Rails.root}/var/lib/one/escenarios/ES002/ctr.zip")}, y empieza a practicar!"
    ##{Rails.root}/app/assets/prueba.zip
    end
  end
end