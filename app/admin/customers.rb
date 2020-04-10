ActiveAdmin.register Customer do

  menu parent: '用户信息'
  permit_params :name, :identityId, :phone, :gender, :address, :meter_id, :charge_id
  # index table showing customer profile
  index do
    selectable_column
    column :name
    column :identityId
    column :phone
    column :address
    column :address
    column "meter" do |customer|
      customer.meter
    end
    toggle_bool_column :gender
    actions do |organization|

      (link_to '开阀', open_valve_admin_customer_path(organization), method: :post) + "  " +
          (link_to '关阀', close_valve_admin_customer_path(organization), method: :post)
    end
  end
  # member action to generate close_volve order
  member_action :close_valve, method: :post do
    customer = Customer.find params[:id]
    if customer.save_order?("close")
      flash[:notice] = "generate open meter order success"
      redirect_to admin_orders_path
    else
      flash[:warning] = "hav't generate meter order "
      redirect_to admin_customer_path
    end
  end
  member_action :open_valve, method: :post do
    customer = Customer.find params[:id]
    if customer.save_order?("open")
      flash[:notice] = "generate close meter order success"
      redirect_to admin_orders_path
    else
      flash[:warning] = "hav't generate meter order yet "
      redirect_to admin_customer_path
    end
  end
  # 添加编辑用户
  form do |f|
    f.inputs "添加用户" do
      f.input :name
      f.input :identityId
      f.input :phone
      f.input :gender
      f.input :address
      f.input :meter_id, as: :select, collection: Meter.all.map { |m| [m.no, m.id] }
      f.input :charge_id, as: :select, collection: Charge.all.map { |c| [c.name, c.id] }
    end
    actions

  end

end
