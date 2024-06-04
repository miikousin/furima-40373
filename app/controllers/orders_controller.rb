class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :redirect_if_own_item#自分が出品した商品の場合の処理

  def index
    @order_form = OrderForm.new#フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
  end
  
  def create
    @order_form = OrderForm.new(order_params)
    @user = User.find(@item.user_id)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order_form).permit(:post_code, :region_id, :city, :house_number, :building_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])#既存の情報を取得する。ネストしているので[:item_id]とする。
  end

  def redirect_if_own_item
    if current_user == @item.user
      redirect_to root_path
    end
  end
end
