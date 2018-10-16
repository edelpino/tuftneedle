module OrdersHelper
  def price_of(product)
    number_to_currency(product.cost)
  end
end
