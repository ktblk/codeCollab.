//= require jquery
//= require jquery_ujs
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


 $(document).ready(function(){
     $(".button a").click(function(){
         $(".overlay").fadeIn(600);
        $(this).toggleClass('btn-open').toggleClass('btn-close');
     });
 });
 $(".overlay").on('click', function(){
     $(".overlay").fadeOut(600);
     $(".button a").toggleClass('btn-open').toggleClass('btn-close');
     open = false;
 });


 $(document).ready(function(){
     $(".button1 a").click(function(){
         $(".overlay1").fadeIn(1000);
        $(this).toggleClass('btn-open1').toggleClass('btn-close1');
     });
 });
 $(".overlay1").on('click', function(){
     $(".overlay1").fadeOut(600);
     $(".button1 a").toggleClass('btn-open1').toggleClass('btn-close1');
     open = false;
 });

 $(document).ready(function(){
     $(".button2 a").click(function(){
         $(".overlay2").fadeIn(1000);
        $(this).toggleClass('btn-open2').toggleClass('btn-close');
     });
 });
 $(".overlay2").on('click', function(){
     $(".overlay2").fadeOut(600);
     $(".button2 a").toggleClass('btn-open2').toggleClass('btn-close');
     open = false;
 });
