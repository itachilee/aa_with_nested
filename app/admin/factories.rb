ActiveAdmin.register Factory do

  menu parent: "制造商"
  permit_params :name
  scope :all
  scope :sorted
  scope :init_with_a

end
