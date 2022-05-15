require 'rails_helper'

RSpec.describe "Warehouses", type: :request do
  describe "Add Item Spec:" do
    it "Item can be added to warehouse" do
      warehouse = Warehouse.create(name: "Amazon Distribution Center", location: "1234 AMZN Way", capacity: 10000)
      item = Item.create(name:"Pillow", weight_lb:1, count:15)

      get "/warehouses/#{warehouse.id}/add_item/#{item.id}"

      expect(warehouse.items.size).to eq(1)
      expect(warehouse.capacity_left()).to eq(9985)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:name]).to eq("Amazon Distribution Center")
      expect(json[:location]).to eq("1234 AMZN Way")
      expect(json[:capacity]).to eq(10000)
      expect(json[:items][0][:count]).to eq(15)
      expect(json[:items][0][:name]).to eq("Pillow")
    end

    it "Item cannot be added to warehouse if over capacity" do
      warehouse = Warehouse.create(name: "Amazon Distribution Center", location: "1234 AMZN Way", capacity: 10000)
      item = Item.create(name:"Pillow", weight_lb:1, count:100000)

      get "/warehouses/#{warehouse.id}/add_item/#{item.id}"

      expect(warehouse.items.size).to eq(0)

      json = JSON.parse(response.body, symbolize_names: true)
      
      expect(json[:errors]).to eq("Item takes warehouse over capactiy. Capactiy: 10000, items: 100000")
    end
  end
end