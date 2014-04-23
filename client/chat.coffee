Template.messages.messages= ->
  Messages.find({}, { sort: time: -1})

Template.input.events
  "keypress input": (e, t) ->
    if e.keyCode is 13 
      text = t.find "#message"
      Messages.insert({message: text.value})	if text.value isnt ''
      text.value = ''


Template.chat.events
  "click #clear-chat": ->
    Meteor.call "removeAllMessages"	
