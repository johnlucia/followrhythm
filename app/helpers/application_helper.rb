module ApplicationHelper
  def photo_cards_markup(images)
    markup = []
    images.each_with_index do |img, i|
      next if i == 0
      start_of_row = (i % 3 == 1)
      end_of_row = (i % 3 == 0)
      last_image = (i == images.length - 1)
      markup << "<div class='row'>" if start_of_row
      markup << "<div class='col-md-4'>"
      markup << "  <h3 class='text-center'>#{img.image_title}</h3>"
      markup << "  <div class='card card-blog'>"

      markup << link_to( image_tag("/assets/img/placeholder.png", data: {src: img.thumbnail().url}),
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

  def pretty_date_for_blog_post(post)
    date = post.published_at
    day_number = ActiveSupport::Inflector.ordinalize(date.day)
    date.strftime("%B #{day_number}")
  end
end
