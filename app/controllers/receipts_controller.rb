class ReceiptsController < ApplicationController
  def show
    @order = Order.find_by(id: params[:order_id])
  end
end
