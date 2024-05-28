class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]#onlyの前にログインしてるか確認。していなければログインページへリダイレクト
  before_action :set_item, only: [:edit, :update]#onlyの前に@item = Item.find(params[:id])を実行することを設定した

  def index
    @items = Item.all.order("created_at DESC")
  end

  def edit
    if @item.user_id == current_user.id #出品者とログインしているユーザーが同じとき
    else
      redirect_to root_path
    end
  end  

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])#show.html.erbで使える
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = current_user.items.build(item_params)# Item.newでありcurrent_userに属している
    if @item.save
      redirect_to items_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :items_description, :category_id, :condition_id, :postage_id, :region_id, :number_of_day_id, :image)
  end  
  def set_item
    @item = Item.find(params[:id])
  end
end
