require 'rails_helper'

RSpec.describe "Warehouses", type: :request do
  describe "Create Spec:" do
    it "Can be created" do
      expect(Item.all.size).to eq(0)

      get "/warehouses/new", params: {
        warehouse: {
          name: "Amazon Distribution Center",
          location: "1234 AMZN Way",
          capacity: 10000
        }
      }

      expect(Warehouse.all.size).to eq(1)

      warehouse = Warehouse.first

      expect(warehouse).to be_a(Warehouse)
      expect(warehouse.name).to eq("Amazon Distribution Center")
      expect(warehouse.location).to eq("1234 AMZN Way")
      expect(warehouse.capacity).to eq(10000)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:name]).to eq("Amazon Distribution Center")
      expect(json[:location]).to eq("1234 AMZN Way")
      expect(json[:capacity]).to eq(10000)
    end

    it "Cannot be created without name" do
      expect(Item.all.size).to eq(0)

      get "/warehouses/new", params: {
        warehouse: {
          location: "1234 AMZN Way",
          capacity: 10000
        }
      }

      expect(Warehouse.all.size).to eq(0)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:errors]).to eq(["Name can't be blank"])
    end

    it "Cannot be created without location" do
      expect(Item.all.size).to eq(0)

      get "/warehouses/new", params: {
        warehouse: {
          name: "Amazon Distribution Center",
          capacity: 10000
        }
      }

      expect(Item.all.size).to eq(0)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:errors]).to eq(["Location can't be blank"])
    end

    it "Cannot be created without capacity" do
      expect(Item.all.size).to eq(0)

      get "/warehouses/new", params: {
        warehouse: {
          name: "Amazon Distribution Center",
          location: "1234 AMZN Way"
        }
      }

      expect(Warehouse.all.size).to eq(0)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:errors]).to eq(["Capacity can't be blank"])
    end
  end
end