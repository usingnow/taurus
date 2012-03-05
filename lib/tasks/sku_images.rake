#encoding:UTF-8
task :sku_images => :environment do
  sku_images = SkuImage.where("id > 8101")

  sku_images.each do |sku_image|

    File.open("/home/sean/RubymineProjects/ebiz/public/paperclip_assets/sku_images1/#{sku_image.sku.number}-#{sku_image.id}.png") do |image|
      sku_image.image = image
    end
    sku_image.save

  end

end