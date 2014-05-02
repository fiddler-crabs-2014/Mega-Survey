$(document).ready(function () {

// send an HTTP DELETE request for the sign-out link
$('a#sign-out').on("click", function (e) {
    e.preventDefault();
    var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
    request.done(function () { window.location = "/"; });
}); //a#sign-out

  $('#signinform').submit(function(e) {
    e.preventDefault(console.log("ajax intercept"));
    $.ajax({
      type: 'POST',
      url: '/signin',
      data: $("#signinform").serialize(),
      success: function(){
      console.log("User logged in"),
      window.location.replace("/");}
      }); //$ajax
    }); //#sign-in
  }); //document ready
