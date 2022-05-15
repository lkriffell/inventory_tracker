class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    if @item.save
      render json: @item
    else
      render json: {"errors": @item.errors.full_messages}
    end
  end

  def index
    @items = Item.all
    if @items.size > 0
      render json: @items
    else
      render json: {"Message": "No items to present"}
    end
  end

  def edit
    @item = Item.find(params[:id])
    if @item.update(strict_item_params)
      render json: @item
    else
      render json: {"errors": @item.errors.full_messages}
    end
  end
  
  private

  def item_params
    params.permit(:name, :weight_lb, :count)
  end

  def strict_item_params
    params.require(:item).permit(:name, :weight_lb, :count)
  end
end