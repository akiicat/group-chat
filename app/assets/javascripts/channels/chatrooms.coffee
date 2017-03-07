App.chatrooms = App.cable.subscriptions.create "ChatroomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    active_chatroom = $("[data-behavior='messages'][data-chatroom-id='#{data.chatroom_id}']")
    if active_chatroom.length > 0

      if document.hidden
        if $(".strike").length == 0
          active_chatroom.append("<div class='strike'><span>Unread Messages</span></div>")
        # 1. Check to see if there is a divider on the page
        # 2. if there is no divider, insert one
        #
        if Notification.permission == "granted"
          new Notification(data.username, { body: data.body })
      else
        # 2. Send a notice to the server of our last_read_at timestamp

      # Insert the message
      active_chatroom.append("<div><strong>#{data.username}:</strong>#{data.body}</div>")

    else
      $("[data-behavior='chatroom-link'][data-chatroom-id='#{data.chatroom_id}']").css("font-weight", "bold")
    # Called when there's incoming data on the websocket for this channel

  send_message: (chatroom_id, message) ->
    @perform "send_message", { chatroom_id: chatroom_id, body: message }
