ActiveAdmin.register Collector do

  menu parent: '设备管理'
  permit_params :name, :no, :gpr_id

  
end
