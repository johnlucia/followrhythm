class AddExternalUrlToRefineryImages < ActiveRecord::Migration
  def change
    add_column :refinery_images, :external_url, :text
  end
end
