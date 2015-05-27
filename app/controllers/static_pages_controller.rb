
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
    flash[:success] = "Es escenario se ha desplegado con éxito. ¡Descárgate los #{view_context.link_to("certificados", "/app/assets/Ejemplo.tar.gz")}, y empieza a practicar!"
    #send_file 'http://ender.dacya.ucm.es/var/lib/one/escenarios/ES002/crt.zip'
    #/var/lib/one/escenarios/ES002/crt.zip
    end
  end
end


#require 'open-uri'
#require 'zlib'

#open('tarball.tar', 'w') do |local_file|
#  open('http://github.com/jashkenas/coffee-script/tarball/master/tarball.tar.gz') do |remote_file|
#    local_file.write(Zlib::GzipReader.new(remote_file).read)
#  end
#end