//= require jquery
// = require jquery_ujs
/* A simple and scalable hamburger menu using css transitions. */
//= require sweetalert

//= require materialize-sprockets
//= require documents

// Initialize collapse button
 // $(".button-collapse").sideNav();
 // Initialize collapsible (uncomment the line below if you use the dropdown variation)
 //$('.collapsible').collapsible();

// Show sideNav
// $('.button-collapse').sideNav('show');
// Hide sideNav
// $('.button-collapse').sideNav('hide');
$('.button-collapse').on('click', function(){
  $('#slide-out').css('transition', '1s')
});
$('.button-collapse').sideNav({
     menuWidth: 200, // Default is 240
     edge: 'right', // Choose the horizontal origin
     closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
   }
 );
