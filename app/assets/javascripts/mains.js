var ready = function () {
  $("#header").hide()
  $('.active').text()
  $('#fullpage').fullpage();
  $(".galleryImage").hover(function() {
    $(this).animate({ height: "auto", width: "350px", left: "-=55", top: "-=55" }, "fast");
  })
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