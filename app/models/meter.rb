class Meter < ApplicationRecord
  has_one :water, dependent: :destroy
  has_many :customers, dependent: :restrict_with_error
  belongs_to :gpr
  belongs_to :factory
  accepts_nested_attributes_for :water, :allow_destroy => true
  scope :recent, -> { order(name: :desc) }
  scope :older, -> { where(name: "%1%") }


  def generate_order?(type)
    # self.id

    @order = Order.new
    if 'add' == type
      @order.cmdcode = 188
    elsif 'delete' == type
      @order.cmdcode = 189
    end
    @order.meter_no = self.no
    @order.water_no = self.water.no
    @order.gprs_no =  self.gpr.no
    # @order.customer_id = self.id # self.meter.gpr.no
    if @order.save
      true
    else
      false
    end
  end
end
