class HomeController < ActionController::Base
  def index
    @slider_bars = SliderBar.all
    @panic_buyings = PanicBuying.all
  end
end