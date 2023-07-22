class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def subtotal
    item.add_tax_price*quantity
  end

  def self.ordertotal
    sum(:quantity)
  end

  enum making_status: {"着手不可": 0,"製作待ち": 1,"製作中": 2,"製作完了": 3}

end
