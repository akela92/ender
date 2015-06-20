class MessageMailer < ActionMailer::Base

  default from: "noreply@ender.dacya.ucm.es <noreply@ender.dacya.ucm.es>"
  default to: "Ender <irrigona@hotmail.com>"

  def new_message(message)
    @message = message
    
    mail subject: "Mensaje de: #{message.name}"
  end

end
