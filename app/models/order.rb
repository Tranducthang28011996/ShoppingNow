class Order < ApplicationRecord
  has_many :order_items
  def self.show
    Category.all
  end
end
