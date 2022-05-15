class Item < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :weight_lb

  belongs_to :warehouse, optional:  true
end
