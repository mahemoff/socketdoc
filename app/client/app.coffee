# Client-side Code

# Bind to events
SS.socket.on 'disconnect', ->  $('.conn-error').show()
SS.socket.on 'connect', ->     $('.conn-error').hide()

# This method is called automatically when the websocket connection is established. Do not rename/delete
exports.init = ->

  # Make a call to the server to retrieve a message
  SS.server.app.init (response) ->
    $('#message').text(response)
  $( () ->
    $("#doc").keyup ->
      console.log "doc changed"
      SS.server.app.updateDoc $("#doc").val()
    SS.events.on 'docUpdated', (doc) ->
      console.log(arguments)
      $("#doc").val(doc.contents)
  )
