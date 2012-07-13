#encoding:UTF-8
class Taurus::BaseController < ApplicationController
	respond_to :html, :json
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
end
