class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    if @item.save
      render json: @item
    end
  end

  def index
    @items = Item.all
    render json: @items
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :weight_lb, :count)
  end
end