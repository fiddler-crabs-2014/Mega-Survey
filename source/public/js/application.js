$(document).ready(function () {

  // send an HTTP DELETE request for the sign-out link
  $('#signout').on("click", function (e) {
      e.preventDefault(console.log("AJAX intercepted logout"));
      var request = $.ajax({ url: '/signout', type: 'get' });
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

  // Dynamic add questions
  var i = 6;
  $("#add_question").on("click", function(){
    var q = "<p id='question"+i+"'>Question "+i+": <input type='text'></p>";
    $("#add_question").before(q);
    $("#question"+i).hide().fadeIn(250);
    i++;
  })

  }); //document ready
