class CloudinaryUploader

  def initialize(image)
    @image = image
  end

  def auth
    {
      cloud_name: ENV['CLOUDINARY_CLOUD_NAME'],
      api_key:    ENV['CLOUDINARY_API_KEY'],
      api_secret: ENV['CLOUDINARY_SECRET'],
      use_filename: true,
      folder: 'rhythm'
    }
  end

  def new_cloudinary_url
    image_path = @image.url
    image_url = "http://www.followrhythm.com#{image_path}"
    puts "\n\n\n\n\n\n\n\n\n\n\n\n\n #{image_url} \n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    image_url = "https://i.kinja-img.com/gawker-media/image/upload/s--VRgSmL1i--/c_scale,f_auto,fl_progressive,q_80,w_800/wsvqhc42bnocrsetkizw.jpg"
    
    response = Cloudinary::Uploader.upload(image_url, auth)
    cloudinary_base_url = response['url']
    transformation_url = cloudinary_base_url.gsub('/upload/','/upload/q_auto,f_auto,fl_lossy/')
  end
end
