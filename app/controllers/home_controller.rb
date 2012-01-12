class HomeController < ActionController::Base
  def index
    @slider_bars = SliderBar.all
    @panic_buyings = PanicBuying.all
    @skus = Sku.limit(8).all
  end
end