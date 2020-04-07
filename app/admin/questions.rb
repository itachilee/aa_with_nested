ActiveAdmin.register Question do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :content, :survey_id,answers_attributes: [:content]
  #
  # or
  #
  # permit_params do
  #   permitted = [:content, :survey_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form  decorate: true do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs "form" do
      f.input :survey_id,as: :select,collection: Survey.all.map{|s| [s.name,s.id] }
      f.input :content
    end
    f.inputs do
      f.has_many :answers do |t|
        t.input :content
      end
    end
    f.actions "operation"
  end
end
