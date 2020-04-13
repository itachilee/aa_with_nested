class Gpr < ApplicationRecord
  has_many :meters
  has_many :collectors

  def group_operation?(type)
    # self.id

    @order = Order.new
    if 'open' == type
      @order.cmdcode = 190
    elsif 'close' == type
      @order.cmdcode = 191
    elsif 'check' == type
      @order.cmdcode == 192
    end
    @order.meter_no = getMetersNo
    # @order.water_no = self.water.no
    @order.gprs_no = self.no
    # @order.customer_id = self.id # self.meter.gpr.no
    if @order.save
      true
    else
      false
    end
  end

  def getMetersNo
    nos =[]
    self.meters.each do|m|
      nos<< m.no
    end
    nos.to_s
  end
end
