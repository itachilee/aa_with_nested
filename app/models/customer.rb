class Customer < ApplicationRecord
  belongs_to :meter

  def save_order?
    # self.id
    @order = Order.new
    @order.water_no = self.meter.water.no
    @order.meter_no = self.meter.no
    @order.gprs_no = self.meter.gpr.no
    if @order.save
      true
    else
      false
    end
  end
  audited
end
