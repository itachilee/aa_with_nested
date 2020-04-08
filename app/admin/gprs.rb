ActiveAdmin.register Gpr do
  menu parent: 'device'
  permit_params :name, :no

  index do
    selectable_column
    column :name
    column :no
    column "collector" do|t|
      t.collectors.map{|c| link_to c.no,admin_collector_path(c.id)}
    end
    actions
  end
end
