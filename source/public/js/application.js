$(document).ready(function () {

// send an HTTP DELETE request for the sign-out link
$('a#sign-out').on("click", function (e) {
    e.preventDefault();
    var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
    request.done(function () { window.location = "/"; });
}); //a#sign-out

  $('#sign-in').submit(function (e) {
    e.preventDefault();
    $.ajax({
      type: 'POST',
      url: '/sessions',
      data: $("#sign-in").serialize(),
      success: function(){
      console.log("User logged in"),
      window.location = '/';}
      }); //$ajax
    }); //#sign-in
  }); //document ready
