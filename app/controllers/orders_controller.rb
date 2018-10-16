class OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.line_items.build
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to order_receipt_path(@order)
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order.order(created_at: :desc)
  end

  def ajax_filter_orders
    @orders = SalesChannel.where(key:params[:key]).orders

    render json: [render_to_string(partial:'orders_table')]
  end

  private
  def order_params
    params.require(:order).permit(:customer_name, line_items_attributes: [:id, :name, :product_id ])
  end

  def products
    @products ||= Product.all
  end
  def sales_channels
    @sales_channels ||= SalesChannel.all
  end

  helper_method :products, :sales_channels
end
