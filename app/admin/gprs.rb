ActiveAdmin.register Gpr do
  menu parent: '设备管理'
  permit_params :name, :no

  index do
    selectable_column
    column "id" do|t|
      link_to t.id,admin_gpr_path(:id)
    end
    excluded = ["id"]
    (Gpr.column_names - excluded).each do |c|
      column c.to_sym
    end
    # column :no
    column "collector" do|t|
      t.collectors.map{|c| link_to c.no,admin_collector_path(c.id)}
    end
    actions  do |organization|

      (link_to '群开', group_open_admin_gpr_path(organization), method: :post) + "  " +
          (link_to '群关', group_close_admin_gpr_path(organization), method: :post,class: 'lextest')
    end
  end


  member_action :group_open, method: :post do
    grp = Gpr.find params[:id]
    if grp.group_operation?("close")
      flash[:notice] = "generate open meter order success"
      redirect_to admin_orders_path
    else
      flash[:warning] = "hav't generate meter order "
      redirect_to admin_customer_path
    end
  end
  member_action :group_close, method: :post do
    grp = Gpr.find params[:id]
    if grp.group_operation?("open")
      flash[:notice] = "generate close meter order success"
      redirect_to admin_orders_path
    else
      flash[:warning] = "hav't generate meter order yet "
      redirect_to admin_customer_path
    end
  end
end
