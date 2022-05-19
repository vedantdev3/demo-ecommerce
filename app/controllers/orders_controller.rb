class OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
  end
  def create
    @order = Order.new(order_params)
    @order.update(user_id: current_user.user_id)
    # order = current_user.cart.cart_item.all
    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Order was successfully Placed." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def order_params
      params.require(:order).permit(:name, :mobile, :address, :city, :pincode, :state, :total, :user_id, :date)
    end
end
