class Rename < ActiveRecord::Migration[6.1]
  def change
    rename_table :image_urls, :images
  end
end
