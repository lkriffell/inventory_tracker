class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    if @item.save
      render json: @item
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :weight_lb, :count)
  end
end