class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])      
    @orderform = OrderForm.new#フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
  end
  
  def create
    @item = Item.find(params[:item_id]) 
    @order_form = OrderForm.new(order_params)
    @user = User.find(@item.user_id)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_form).permit(:attr1, :attr2, :attr3).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
