class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    # ChatroomsChannel.broadcast_to message.chatroom,
    #   message: MessagesController.render(message),
    #   chatroom_id: message.chatroom.id
    ActionCable.server.broadcast "chatrooms:#{message.chatroom.id}",
      message: MessagesController.render(message),
      chatroom_id: message.chatroom.id
  end
end
