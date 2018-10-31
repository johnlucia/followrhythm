Refinery::Image.class_eval do
  def best_url
    external_url || url
  end

  def best_thumbnail_url
  end
end
