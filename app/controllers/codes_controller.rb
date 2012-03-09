class CodesController < ApplicationController
  def index
    validate_image = ValidateImage.new(4)
    session[:code] = validate_image.code
    send_data(validate_image.code_image, :type => 'image/jpeg')
  end

  def show
    pdf = Prawn::Document.new
    pdf.text "Hello World"
    send_data pdf.render, type: "application/pdf", disposition: "inline"
  end
end
