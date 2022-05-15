require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  subject {
    described_class.new(name: "Jen's Flower Warehouse",
                        location: "Flower Ave, 12345",
                        capacity: 100)
  }

  describe 'validations' do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a capacity" do
      subject.capacity = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a location" do 
      subject.location = nil
      expect(subject).to_not be_valid
    end

    it "can have items" do
      subject.save
      subject.items.create(name:"Rose", weight_lb:0.02, count: 30)
      subject.items.create(name:"Tulip", weight_lb:0.02, count: 30)
      expect(subject.items.size).to eq(2)
    end

    it "cannot have more items than capacity" do
      subject.save
      subject.items.create(name:"Rose", weight_lb:0.02, count: 101)
    end
  end

  describe "model methods" do
    it "capacity_left" do
      subject.save
      subject.items.create(name:"Rose", weight_lb:0.02, count: 50)
      expect(subject.capacity_left()).to eq(50)
    end

    describe "can_add_item_to_warehouse?" do
      it "over capacity" do
        item = Item.create(name:"Rose", weight_lb:0.02, count: 101)
        expect(subject.can_add_item_to_warehouse?(item)).to eq(false)
      end

      it "less than equal capacity" do
        item = Item.create(name:"Rose", weight_lb:0.02, count: 100)
        expect(subject.can_add_item_to_warehouse?(item)).to eq(true)
      end
    end
  end
end