# make sure the product images directory exists
FileUtils.mkdir_p "#{Rails.root}/public/taurus/product_images/"

1.upto(4).each do |key|
  Dir.glob(File.join("#{File.dirname(__FILE__)}/product_images/#{key}", '*.{png}')).each do |file_path|
    File.open(file_path) do |image|
      puts "-- Processing image: #{file_path}\r"
      Taurus::ProductImage.create(:product_id => key, :image => image)
    end
  end
end