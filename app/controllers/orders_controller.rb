class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :redirect_if_not_permitted, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_form = OrderForm.new#フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
  end
  
  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order_form).permit(:post_code, :region_id, :city, :house_number, :building_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])#既存の情報を取得する。ネストしているので[:item_id]とする。
  end

  def redirect_if_not_permitted
    if current_user == @item.user || @item.purchase.present?#ログインユーザーが商品の出品者である、またはその商品が既に購入されている場合
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
