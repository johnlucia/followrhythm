namespace :image_utilities do
  desc "Upload images to cloudinary if they dont already have a remote_url"
  task upload_to_cloudinary: :environment do
    auth = {
      cloud_name: ENV['CLOUDINARY_CLOUD_NAME'],
      api_key:    ENV['CLOUDINARY_API_KEY'],
      api_secret: ENV['CLOUDINARY_SECRET'],
      use_filename: true,
      folder: 'rhythm'
    }

    local_images = Refinery::Image.where(external_url: nil).limit(10)

    local_images.each do |image|
      image_path = image.url
      image_url = "http://www.followrhythm.com#{image_path}"
      
      response = Cloudinary::Uploader.upload(image_url, auth)
      cloudinary_base_url = response['url']
      transformation_url = cloudinary_base_url.gsub('/upload/','/upload/q_auto,f_auto,fl_lossy/')
      puts transformation_url
      image.update_attributes(external_url: transformation_url)
    end
  end
end
