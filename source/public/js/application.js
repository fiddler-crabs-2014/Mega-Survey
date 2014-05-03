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
  $("#add_question").on("click", function(){
    var i = $("form > p").size() + 1;
    var q = "<p id='question"+i+"'>Question "+i+": <input type='text' name='question"+i+"'><button class='remove_question' type='button'>Remove Question</button></p>";
    $("#add_question").before(q);
    $("#question"+i).hide().fadeIn(250);
  })
  // Dynamic delete questions
  $("form").on("click", ".remove_question", function(){
    $(this).closest("p").remove();
  })

  }); //document ready
