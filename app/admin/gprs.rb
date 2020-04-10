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
    actions
  end
end
