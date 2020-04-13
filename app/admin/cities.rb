ActiveAdmin.register City do

  permit_params :name, :location, :region_id,plan_ids: []

  form do |f|
    # f.inputs "cities selector"
    f.inputs "上级区域选择" do
          f.input :region_id, as: :nested_select,
                  level_1: {attribute: :country_id},
                  level_2: {attribute: :region_id}
          # level_3: {attribute: :city_id}
        end
    f.inputs :name
    f.inputs :location
    f.inputs "计划" do
      f.input :plan_ids, as: :tags, collection: Plan.all, display_name: :plan_name

    end
    # f.inputs :region_id,as: :select,collection: Region.all.map { |r| [r.name,r.id]  }


    actions
  end
end
