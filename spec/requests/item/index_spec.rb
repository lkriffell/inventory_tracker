require 'rails_helper'

RSpec.describe "Items", type: :request do
  describe "Index Spec:" do
    it "Can get list of all items" do
      expect(Item.all.size).to eq(0)
 
      Item.create(name:"Donut", weight_lb:0.5)
      Item.create(name:"Hat", weight_lb:0.25)
      Item.create(name:"Iphone", weight_lb:1)
      Item.create(name:"Tractor", weight_lb:1)

      expect(Item.all.size).to eq(4)

      get '/items'

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json.length).to eq(4)
      expect(json[0][:name]).to eq("Donut")
      expect(json[1][:name]).to eq("Hat")
      expect(json[2][:name]).to eq("Iphone")
      expect(json[3][:name]).to eq("Tractor")
    end

    it "Can get list of 0 items" do
      expect(Item.all.size).to eq(0)

      get '/items'

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to eq("Message": "No items to present")
    end
  end
end