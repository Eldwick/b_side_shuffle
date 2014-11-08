var ready = function () {
  $('.active').text()
  $('#fullpage').fullpage();
  $('.active').on("mousewheel", function () {
    if($('.active h1').text() == "Splash"){
      $("#header").hide()
    } else {
      $("#header").fadeIn("slow")
    }
  })



}

$(document).ready(ready);
$(document).on('page:load', ready);