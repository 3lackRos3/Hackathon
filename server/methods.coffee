Meteor.startup ->
  Meteor.methods removeAllMessages: ->
    Messages.remove {}
