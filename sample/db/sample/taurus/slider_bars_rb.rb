# make sure the product images directory exists
FileUtils.mkdir_p "#{Rails.root}/public/taurus/slider_bars/"

Taurus::SliderBar.all.each do |slider_bar|
	Dir.glob(File.join("#{File.dirname(__FILE__)}/slider_bars/#{slider_bar.id}", '*.{png}')).each do |file_path|
    File.open(file_path) do |image|
    	puts "-- Processing image: #{file_path}\r"
      slider_bar.update_attributes(:image => image)
    end
  end
end
