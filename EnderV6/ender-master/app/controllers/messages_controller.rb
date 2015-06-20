class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    
    if @message.valid?
      MessageMailer.new_message(@message).deliver
      flash[:success] = "Tu mensaje ha sido enviado."
      redirect_to contact_path
    else
      flash[:alert] = "Ha ocurrido un error en el envío de tu mensaje."
      render :new
    end
  end

private

  def message_params
    params.require(:message).permit(:name, :email, :content)
  end

end
