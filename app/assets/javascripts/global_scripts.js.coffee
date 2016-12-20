$ -> 
  $(".fancybox").fancybox()
  $(".lazy-images img").unveil()
  $(".video, .fluid-width-videos").fitVids() unless $('html.ie9, html.ie8, html.ie7, html.ie6').length
  $(".fluid-width-videos h2").after("<div class='separator separator-danger'>✻</div>")

  if $("#blog-page").length
    scroll_target = "#firstSection"
    $('html, body').animate({
      scrollTop: $(scroll_target).offset().top - 50
    }, 1500)
