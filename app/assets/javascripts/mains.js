var ready = function () {
  $("#header").hide()
  $('.active').text()
  $('#fullpage').fullpage();
  $('#fullpage').on("mousewheel", function () {
    if($('.active h1').text() == "Splash"){
      $("#header").fadeOut(600)
    } else {
      $("#header").fadeIn(600)
    }
  })
}

$(document).ready(ready);
$(document).on('page:load', ready);