class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])      
    @order_form = OrderForm.new#フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
  end

  def new
    @order_form = Order_form.new
  end
  
  def create
    @item = Item.find(params[:item_id]) 
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order_form).permit(:post_code, :region_id, :city, :house_number, :building_name, :tel, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
