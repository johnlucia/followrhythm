scrollToMap = () ->
  $('html, body').animate({ scrollTop: $("#route-map").offset().top - 75 }, 2000)

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

    divs = $('.article-preview')
    i = 0
    while i < divs.length
      divs.slice(i, i + 2).wrapAll "<div class='row'></div>"
      i += 2

  if $("#route-map").length
    window.setTimeout( scrollToMap, 2000 )
