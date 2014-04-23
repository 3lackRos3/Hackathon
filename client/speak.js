//Template.speak.rendered = function () {
  //var room = location.search && location.search.split('?')[1];
  
  //// initialize webrtc
  //webrtc = new SimpleWebRTC({
    //localVideoEl: 'localVideo',
    //remoteVideosEl: '',
    //autoRequestMedia: true,
    //debug: false,
    //detectSpeakingEvents: true,
    //autoAdjustMic: false
  //});

  //// connect call
  //webrtc.once('readyToCall', function () {
    //if (room) webrtc.joinRoom(room);
  //});

  //// add remote videos
  //webrtc.on('videoAdded', function (video, peer) {
    //var remotes = document.getElementById('remotes');
    //if (remotes) {
      //var d = document.createElement('div');
      //d.className = 'col-md-6';
      //d.id = 'container_' + webrtc.getDomId(peer);
      //d.appendChild(video);
      //var vol = document.createElement('div');
      //vol.id = 'volume_' + peer.id;
      //vol.className = 'volume_bar';
      //d.appendChild(vol);
      //remotes.appendChild(d);
    //}
  //});

  //// remove remote videos
  //webrtc.on('videoRemoved', function (video, peer) {
    //var remotes = document.getElementById('remotes');
    //var el = document.getElementById('container_' + webrtc.getDomId(peer));
    //if (remotes && el) {
      //remotes.removeChild(el);
    //}
  //});
  //// function to prepare room
  //function setRoom(name) {
    //$('form').remove();
    //$('h1').text(name);
    //$('#subTitle').text(location.href).addClass('alert alert-dismissable alert-warning');
    //$('body').addClass('active');
  //}

  //if (room) {
    //setRoom(room);
  //} else {
    //$('form').submit(function () {
      //var val = $('#sessionInput').val().toLowerCase().replace(/\s/g, '-').replace(/[^A-Za-z0-9_\-]/g, '');
      //webrtc.createRoom(val, function (err, name) {
        //console.log(' create room cb', arguments);

        //$('#leave').css('display', 'inline');
        //$('#copy').css('display', 'inline');
        //$(".clock").TimeCircles({
          //time:{
            //Days: {
              //show: false
            //}
          //}
        //});
        //var newUrl = location.pathname + '?' + name;
        //if (!err) {
          //history.replaceState({foo: 'bar'}, null, newUrl);
          //setRoom(name);
        //} else {
          //console.log(err);
        //}
      //});
      //return false;          
    //});
  //}

  //if (window.location.href != "http://localhost:3000/speak") {
    //$('#leave').css('display', 'inline');
    //$('#copy').css('display', 'inline');
    //$(".clock").TimeCircles({
      //time:{
        //Days: {
          //show: false
        //}
      //}
    //});
  //}
//}
//Template.speak.events({
  //'click #leave' : function () {
  //},
  //'click #copy': function(){
    //window.prompt('Share this url to anyone you want to connect:', window.location.href);
  //}
//});
