class CartCell < BaseCell

  def display(args)
    @cart =  Taurus::Cart.find_by_id(args[:cart_id])

    render
  end
end