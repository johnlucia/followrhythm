$ -> 
  $(".fancybox").fancybox()
  $(".lazy-images img").unveil()
  $(".video, .fluid-width-videos").fitVids() unless $('html.ie9, html.ie8, html.ie7, html.ie6').length
  $(".fluid-width-videos h2").after("<div class='separator separator-danger'>✻</div>")
