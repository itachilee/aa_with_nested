ActiveAdmin.register Water do
  menu parent: 'device'

  permit_params :name, :no, :meter_id


end
