class WarehousesController < ApplicationController
  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
      render json: @warehouse
    else
      render json: {"errors": @warehouse.errors.full_messages}
    end
  end
  
  def add_item
    @warehouse = Warehouse.find(params[:id])
    @item = Item.find(params[:item_id])
    if @warehouse.can_add_item_to_warehouse?(@item)
      @warehouse.items << @item
      render json: @warehouse, include: :items
    else
      render json: {"errors": "Item takes warehouse over capactiy. Capactiy: #{@warehouse.capacity}, items: #{@item.count}"}
    end
  end

  private

  def warehouse_params
    params.require(:warehouse).permit(:name, :location, :capacity)
  end
end