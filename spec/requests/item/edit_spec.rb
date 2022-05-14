require 'rails_helper'

RSpec.describe "Items", type: :request do
  describe "Edit Spec:" do
    it "Can be edited" do
      item = Item.create(name:"Bad Item", weight_lb: 100000)

      get "/items/#{item.id}/edit", params: {
        item: {
          name: "Guitar",
          weight_lb: 5,
          count: 1
        }
      }

      item.reload
      expect(item.name).to eq("Guitar")
      expect(item.weight_lb).to eq(5)
      expect(item.count).to eq(1)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:name]).to eq("Guitar")
      expect(json[:weight_lb]).to eq(5)
      expect(json[:count]).to eq(1)
    end

    it "Name cannot be edited to a blank string" do
      item = Item.create(name:"Bad Item", weight_lb: 100000)

      get "/items/#{item.id}/edit", params: {
        item: {
          name: "",
          weight_lb: 5,
          count: 1
        }
      }

      item.reload
      expect(item.name).to eq("Bad Item")
      expect(item.weight_lb).to eq(100000)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:errors]).to eq(["Name can't be blank"])
    end
  end
end