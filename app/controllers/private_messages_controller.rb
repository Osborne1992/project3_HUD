class PrivateMessagesController < ApplicationController

  load_and_authorize_resource

  def index
    @private_messages = PrivateMessage.all.order(:name)
  end

  def show
    @private_message = find_private_message
  end

  def new
    @private_message = current_user.private_messages.new
  end

  def create
    private_message = current_user.created_private_messages.create(private_message_params)
    redirect_to( private_message_path( private_message.id ) )
  end

  def destroy
    private_message = find_private_message
    private_message.destroy
    redirect_to(private_messages_path)
  end

  def edit
    @private_message = find_private_message
  end

  def update
    private_message = find_private_message
    private_message.update(private_message_params)
    redirect_to(private_message_path(private_message.id))
  end

  private

  def find_private_message
    PrivateMessage.find(params[:id])
  end

  def private_message_params
    params.require(:private_message).permit(:sender_id, :recipient_id, :message)
  end

end