class HomeController < ActionController::Base
  def index
    @slider_bars = SliderBar.limit(5).all
    @panic_buyings = PanicBuying.limit(4).all
    @skus = Sku.limit(8).all
  end
end