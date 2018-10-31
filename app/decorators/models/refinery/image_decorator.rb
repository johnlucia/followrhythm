Refinery::Image.class_eval do
  def best_url
    external_url || url
  end

  def best_small_url
    if external_url
      external_url.gsub("q_auto,f_auto,fl_lossy", "w_360,c_scale,q_auto,f_auto,fl_lossy")
    else
      url
    end
  end

  def best_tiny_url
    if external_url
      external_url.gsub("q_auto,f_auto,fl_lossy", "w_100,h_100,c_fill,q_auto,f_auto,fl_lossy")
    else
      url
    end
  end
end
