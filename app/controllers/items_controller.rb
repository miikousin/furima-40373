class ItemsController < ApplicationController
  def index
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :items_description, :category_id, :postage_id, :region_id, :number_of_day_id, :image)
  end  
  
end
