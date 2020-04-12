class Customer < ApplicationRecord
  belongs_to :meter

  def save_order?(type)
    # self.id
    @order = Order.new
    if 'open' == type
      @order.cmdcode = 186
    elsif 'close' == type
      @order.cmdcode = 187
    end
    @order.customer_no = self.name
    @order.water_no = self.meter.water.no
    @order.meter_no = self.meter.no
    @order.gprs_no =  self.meter.gpr.no
    @order.customer_id = self.id # self.meter.gpr.no
    if @order.save
      true
    else
      false
    end
  end

  # audited operation log
  audited
end
