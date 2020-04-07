ActiveAdmin.register Page do

  permit_params :name, :content, :ancestry, :parent_id

  form do |f|
    f.inputs do
      f.input :name
      f.input :content
      f.input :parent_id, as: :select, collection: Page.all.map { |u| [u.name, u.id] }, :prompt => "请选择"
      f.input :parent_id, as: :select, collection: Page.at_depth(1) .map { |u| [u.name, u.id] }, :prompt => "请选择"
    end

  end


end
