ActiveAdmin.register City do

  permit_params :name, :location, :region_id

  form do |f|
    # f.inputs "cities selector"
    f.inputs do
          f.input :region_id, as: :nested_select,
                  level_1: {attribute: :country_id},
                  level_2: {attribute: :region_id}
          # level_3: {attribute: :city_id}
        end
    f.inputs :name
    f.inputs :location
    # f.inputs :region_id,as: :select,collection: Region.all.map { |r| [r.name,r.id]  }


    actions
  end
end
