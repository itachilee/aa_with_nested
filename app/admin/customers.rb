ActiveAdmin.register Customer do

  menu parent: 'customer'
  permit_params :name, :identityId, :phone, :gender, :address, :meter_id

  
end
