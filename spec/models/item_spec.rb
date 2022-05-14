require 'rails_helper'

RSpec.describe Item, type: :model do
  subject {
    described_class.new(name: "Donut",
                        weight_lb: 0.5,
                        count: 12)
  }

  describe 'validations' do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a weight_lb" do 
      subject.weight_lb = nil
      expect(subject).to_not be_valid
    end

    it "is valid without a count" do
      subject.count = nil
      expect(subject).to be_valid
    end

    it "is valid without a count of 0" do
      subject.count = 0
      expect(subject).to be_valid
    end
  end
end