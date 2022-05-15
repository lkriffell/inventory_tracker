require 'rails_helper'

RSpec.describe "Items", type: :request do
  describe "Create Spec:" do
    it "Can be created" do
      expect(Item.all.size).to eq(0)

      post "/items", params: {
        item: {
          name: "Guitar",
          weight_lb: 5,
          count: 1
        }
      }

      expect(Item.all.size).to eq(1)

      item = Item.first

      expect(item).to be_an(Item)
      expect(item.name).to eq("Guitar")
      expect(item.weight_lb).to eq(5)
      expect(item.count).to eq(1)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:name]).to eq("Guitar")
      expect(json[:weight_lb]).to eq(5)
      expect(json[:count]).to eq(1)
    end

    it "Count is 1 when no count specified" do
      expect(Item.all.size).to eq(0)

      post "/items", params: {
        item: {
          name: "Guitar",
          weight_lb: 5
        }
      }

      expect(Item.all.size).to eq(1)

      item = Item.first
      expect(item.count).to eq(1)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:name]).to eq("Guitar")
      expect(json[:weight_lb]).to eq(5)
      expect(json[:count]).to eq(1)
    end

    it "Cannot be created without name" do
      expect(Item.all.size).to eq(0)

      post "/items", params: {
        item: {
          weight_lb: 5,
          count: 1
        }
      }

      expect(Item.all.size).to eq(0)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:errors]).to eq(["Name can't be blank"])
    end

    it "Cannot be created without weight_lb" do
      expect(Item.all.size).to eq(0)

      post "/items", params: {
        item: {
          name: "Guitar",
          count: 1
        }
      }

      expect(Item.all.size).to eq(0)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:errors]).to eq(["Weight lb can't be blank"])
    end
  end
end