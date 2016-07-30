$(function(){
  function init() {
    //// Initialize Firebase.
    var firepadRef = getRef();

    var editor = ace.edit("firepad-container");
    editor.setTheme("ace/theme/textmate");
    var session = editor.getSession();
    session.setUseWrapMode(true);
    session.setUseWorker(false);
    session.setMode("ace/mode/javascript");

    //// Create Firepad.
    var firepad = Firepad.fromACE(firepadRef, editor, {
      defaultText: '// JavaScript Editing with Firepad!\nfunction go() {\n  var message = "Hello, world.";\n  console.log(message);\n}'
    });
  }

  function getRef() {
    // var ref = new Firebase('https://firepad.firebaseio-demo.com');
    var ref = new Firebase('https://firepadcollap.firebaseio.com/firepad');
    var id = $('#currID').val();

    var hash = window.location.hash.replace(/#/g, '');
    if (hash) {
      ref = ref.child(hash);
    } else {
      ref = ref.push(); // generate unique location.
      window.location = window.location + '#' + ref.key(); // add it as a hash to the URL.
    }
    if (typeof console !== 'undefined')
      console.log('Firebase data: ', ref.toString());
    return ref;
  }

  window.onload = init;
  var chatRef = new Firebase("https://firechat-demo.firebaseio.com");
  var chat = new FirechatUI(chatRef, document.getElementById("firechat-wrapper"));
  var username = $('#currName').val();
  chatRef.onAuth(function(authData) {
    if (authData) {
      chat.setUser(authData.uid, username);
    } else {
      chatRef.authAnonymously(function(error, authData) {
        if (error) {
          console.log(error);
        }
      });
    }
  });
})
