ActiveAdmin.register Meter do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :no,:gpr_id,water_attributes: [:name,:no]
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :no]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do|f|
    f.inputs do
      f.input :name
      f.input :no

    end
    f.inputs do
      f.input :gpr_id,as: :select,collection: Gpr.all.map{|g| [g.no,g.id]}
      f.has_many :water,class: 'has_one' do |t|
        t.input :name
        t.input :no
      end
    end
    f.actions
  end
end
