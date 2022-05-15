class WarehousesController < ApplicationController
  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
      render json: @warehouse
    else
      render json: {"errors": @warehouse.errors.full_messages}
    end
  end
  
  private

  def warehouse_params
    params.require(:warehouse).permit(:name, :location, :capacity)
  end
end