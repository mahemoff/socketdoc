# Server-side Code

exports.actions =
  init: (cb) ->
    cb "SocketStream version #{SS.version} is up and running. This message was sent over websockets, so everything is working OK."
  updateDoc: (contents,cb) ->
    SS.publish.broadcast "docUpdated", {contents: contents}
    cb true
