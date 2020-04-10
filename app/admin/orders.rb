ActiveAdmin.register Order do

  permit_params :gprs_no, :water_no, :meter_no, :customer_no, :customer_id,:cmdcode

  
end
