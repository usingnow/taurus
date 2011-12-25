class CodesController < ApplicationController
  def index
    validate_image = ValidateImage.new(4)
    session[:code] = validate_image.code
    send_data(validate_image.code_image, :type => 'image/jpeg')
  end
end
