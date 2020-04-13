ActiveAdmin.register Plan do


  permit_params :plan_name,city_ids:[]

  form do|f|
    f.inputs "选择小组" do
       f.input :city_ids, as: :tags, collection: City.all, display_name: :name
    end
    actions
  end
end
