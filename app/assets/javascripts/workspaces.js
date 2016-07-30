$(document).on('ready page:load', function () {

  function init() {
    //// Initialize Firebase.
    var firepadRef = new Firebase('https://firepad.firebaseio-demo.com');

    var editor = ace.edit("firepad-container");
    editor.setTheme("ace/theme/textmate");
    var session = editor.getSession();
    session.setUseWrapMode(true);
    session.setUseWorker(false);
    session.setMode("ace/mode/ruby");
    //// Create Firepad.
    var firepad = Firepad.fromACE(firepadRef, editor, {
      defaultText: '// JavaScript Editing with Firepad!\nfunction go() {\n  var message = "Hello, world.";\n  console.log(message);\n}'
    });

    firepad.on('ready', function() {
      console.log(firepad.getText())
    });
  }
  init();

})
