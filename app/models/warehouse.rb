class Warehouse < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :location
  validates_presence_of :capacity

  has_many :items

  def capacity_left()
    capacity_taken = 0
    items.each do |item|
      capacity_taken += item.count 
    end
    capacity - capacity_taken
  end

  def can_add_item_to_warehouse?(item)
    capacity_left = capacity_left()
    if item.count <= capacity_left
      true
    else
      false
    end
  end
end