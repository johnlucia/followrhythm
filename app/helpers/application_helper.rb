module ApplicationHelper
  def photo_cards_markup(images)
    markup = []
    images.each_with_index do |img, i|
      next if i == 0
      start_of_row = (i % 3 == 1)
      end_of_row = (i % 3 == 0)
      last_image = (i == images.length - 2)
      markup << "<div class='row'>" if start_of_row
      markup << "<div class='col-md-4'>"
      markup << "  <h3 class='text-center'>#{img.image_title}</h3>"
      markup << "  <div class='card card-blog'>"

      markup << link_to( image_tag("/assets/img/ajax-loader.gif", data: {src: img.thumbnail().url}),
                         img.url,
                         class: "fancybox header",
                         rel: "group",
                         title: raw(@page.caption_for_image_index(i))
                        )
      markup << "  </div>"
      markup << "</div>"
      markup << "</div>" if end_of_row || last_image
    end
    markup.join("").html_safe
  end
end
