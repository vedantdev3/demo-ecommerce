class CartsController < ApplicationController
  def index
    # byebug
    @cart_items = current_user.cart.cart_items.order(:product_id)
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
		cart = current_user.cart
		product = Product.find(params[:product_id])
		ci = cart.cart_items.find_by(product_id: product.id)	
		if ci.blank?
		  cart.cart_items.create(product_id: product.id, quantity: 1, total: product.price)
		else
		  ci.update(product_id: product.id, quantity: (ci.quantity + 1), total: (ci.quantity + 1)*(product.price))
		end
		cart.total = cart.cart_items.pluck(:total).reduce(:+)
		cart.save!
		redirect_to root_path
  end

  def add_more
		cart_item = CartItem.find(params[:cart_item])
    # sum = (cart_item.total)/cart_item.quantity
    sub = cart_item.total
    cart_item.update(product_id: cart_item.product_id, quantity:cart_item.quantity+1, total: (cart_item.quantity + 1)*cart_item.product.price)
    tootal = current_user.cart.total + cart_item.total - sub
    current_user.cart.update(total:tootal) 
		redirect_to carts_path
  end

  def remove_one
    cart_item = CartItem.find(params[:cart_item])
    
    if(cart_item.quantity == 1)
      return redirect_to carts_path
    else
      sub = cart_item.total
      cart_item.update(product_id: cart_item.product_id, quantity:cart_item.quantity-1, total: (cart_item.quantity - 1)*cart_item.product.price)
      tootal = current_user.cart.total + cart_item.total - sub
      current_user.cart.update(total:tootal)
      redirect_to carts_path
    end
  end

  def remove_from_cart
    cart_item = CartItem.find(params[:cart_item])
    tootal = current_user.cart.total - cart_item.total
    cart_item.destroy
    current_user.cart.update(total:tootal)
      redirect_to carts_path
  end

end
