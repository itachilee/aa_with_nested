ActiveAdmin.register CustomerCurrency do


  permit_params :customer_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:customer_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
      Customer.column_names.each do|c|
        column :c.to_sym
      end
  end
end
