@Messages = new Meteor.Collection 'messages'

Router.configure
  layoutTemplate: 'layout',
    
Router.map ->
  @route 'welcome', path: '/'

  @route 'speak', path: 'speak'

  @route 'about', path: 'about'

if Meteor.isClient
  Template.speak.rendered = ->
    # initialize webrtc
    room = location.search and location.search.split("?")[1]
    webrtc = new SimpleWebRTC(
      localVideoEl: "localVideo"
      remoteVideosEl: ""
      autoRequestMedia: true
      debug: false
      detectSpeakingEvents: true
      autoAdjustMic: false
    )
    # connect call
    webrtc.once "readyToCall", ->
      webrtc.joinRoom room  if room

    # add remote videos
    webrtc.on "videoAdded", (video, peer) ->
      remotes = document.getElementById("remotes")
      if remotes
        d = document.createElement("div")
        d.className = "col-md-6"
        d.id = "container_" + webrtc.getDomId(peer)
        d.appendChild video
        vol = document.createElement("div")
        vol.id = "volume_" + peer.id
        vol.className = "volume_bar"
        d.appendChild vol
        remotes.appendChild d

    # remove remote videos
    webrtc.on "videoRemoved", (video, peer) ->
      remotes = document.getElementById("remotes")
      el = document.getElementById("container_" + webrtc.getDomId(peer))
      remotes.removeChild el  if remotes and el

    # function to prepare room
    setRoom = (name) ->
      $("form").remove()
      $("h1").text name
      $("#subTitle").text(location.href).addClass "alert alert-dismissable alert-warning"
      $("body").addClass "active"

    if room
      setRoom room
    else
      $("form").submit ->
        val = $("#sessionInput").val().toLowerCase().replace(/\s/g, "-").replace(/[^A-Za-z0-9_\-]/g, "")
        webrtc.createRoom val, (err, name) ->
          #console.log " create room cb", arguments_
          $("#leave").css "display", "inline"
          $("#copy").css "display", "inline"
          $(".clock").TimeCircles time:
            Days:
              show: false

          newUrl = location.pathname + "?" + name
          unless err
            history.replaceState
              foo: "bar"
            , null, newUrl
            setRoom name
          else
            console.log err

        false

    unless window.location.href is "http://localhost:3000/speak"
      $("#leave").css "display", "inline"
      $("#copy").css "display", "inline"
      $(".clock").TimeCircles time:
        Days:
          show: false

    return

  Template.speak.events
    "click #leave": ->
      Meteor.call "removeAllMessages"	
    "click #copy": ->
      window.prompt "Share this url to anyone you want to connect:", window.location.href

  Template.welcome.events
    "click .get-room": ->
      Meteor.call "removeAllMessages"	


  Template.chat.messages= ->
    Messages.find({}, { sort: time: -1})

  Template.chat.events
    "keypress input": (e, t) ->
      if e.keyCode is 13 
        text = t.find "#message"
        Messages.insert({message: text.value})	if text.value isnt ''
        text.value = ''


  Template.chat.events
    "click #clear-chat": ->
      Meteor.call "removeAllMessages"	

if Meteor.isServer
  Meteor.startup ->
    Meteor.methods removeAllMessages: ->
      Messages.remove {}
