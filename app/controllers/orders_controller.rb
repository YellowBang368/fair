class OrdersController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create]

  http_basic_authenticate_with name: "air", password: "air", only: :index

  def index
    @order = Order.all
  end

  def create
    @order = Order.new(params.require(:order).permit!)
    @order.save

    redirect_to '/ty'
  end
end