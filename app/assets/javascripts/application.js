//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on( "click", '#workspace', function() {
  var $this = $(this)
      url = $this.data('url');

  var ref = new Firebase('https://firepad.firebaseio-demo.com');

  var hash = window.location.hash.replace(/#/g, '');

  if (hash) {
    ref = ref.child(hash);
    console.log("HERE")
  } else {
    ref = ref.push(); // generate unique location.
    window.location = window.location + url + '/#' + ref.key(); // add it as a hash to the URL.
  }
});
