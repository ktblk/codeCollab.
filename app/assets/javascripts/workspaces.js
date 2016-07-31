$(document).ready(function(){


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
    var file_id = window.location.search.split("=")[1];
    if ( file_id != undefined) {
      $.ajax({
        url: "documents/retreive/"+ file_id,
        type: "GET",
        success: function(data) {
          var firepad = Firepad.fromACE(firepadRef, editor, {
            defaultText: data
          });
          execute(firepad);
        },
        error: function (error){
          console.warn("Error", error);
        }
      });
    }else {
      var firepad = Firepad.fromACE(firepadRef, editor, {
        defaultText: '// JavaScript Editing with Firepad!\nfunction go() {\n  var message = "Hello, world.";\n  console.log(message);\n}'
      })
      execute(firepad);
    }
  }

  function execute(firepad){
    var fire_text = "";

    firepad.on("ready", function(){
      fire_text = firepad.getText();
    });

    firepad.on('synced', function(isSynced) {
      // isSynced will be false immediately after the user edits the pad,
      // and true when their edit has been saved to Firebase.
      fire_text = firepad.getText()
    });

    $( "button.savefile" ).click(function() {
      $.ajax({
        url : "/users/documents",
        type: "POST",
        data : { document: { file: fire_text } },
        success: function(data) {
          console.log("Success", data);
        },
        error: function (error){
          console.error(error);
        }
      });
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
  })

})
