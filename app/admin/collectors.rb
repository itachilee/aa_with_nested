ActiveAdmin.register Collector do

  menu parent: 'device'
  permit_params :name, :no, :gpr_id

  
end
