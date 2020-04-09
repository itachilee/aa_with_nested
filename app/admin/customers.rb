ActiveAdmin.register Customer do

  menu parent: 'customer'
  permit_params :name, :identityId, :phone, :gender, :address, :meter_id

  index do
    selectable_column


    Customer.column_names.each do |c|
      column c.to_sym
    end
    actions do |organization|
      # could use string but it's a dirty thing
      #(link_to '开阀', open_valve_admin_meter_valf_path(organization))
      #+ " " + (link_to '关阀', open_valve_admin_meter_valf_path(organization))
      (link_to '开阀', close_valve_admin_customer_path(organization),method: :post)+ "  "+
          (link_to '关阀', close_valve_admin_customer_path(organization),method: :post)
      # text_node " " # or "&nbsp;"
      # a '关阀',class: 'member_link',title:'关阀',href: close_valve_admin_meter_valf_path(organization)
    end
  end
  member_action :close_valve, method: :post do
    customer = Customer.find params[:id]
    if customer.save_order?
      flash[:notice] = "true"
      redirect_to admin_orders_path
    else
      flash[:notice] = "This is a test notice!"
      redirect_to admin_customer_path
    end
  end


end
