$(document).ready(function() {
  $("html").on("mousemove", function() { 
    $(".svg-content").attr("class", "svg-content animate-with-js");
    $("body").css({
      "background-image": 'url(assets/clouds-nologo.png)'
    });
  });

});