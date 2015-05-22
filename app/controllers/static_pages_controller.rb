
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
    if string.include? "Hola mundo"
    flash[:success] = "Go to your #{view_context.link_to("profile page", help_path)}, and edit it!"
  
  end
  end
end

 