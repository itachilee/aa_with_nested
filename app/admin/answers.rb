ActiveAdmin.register Answer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :content, :question_id,question_attributes: [:content]


  form do |f|
    # f.inputs "form"
    # f.input :content
    f.input :question_id, as: :nested_select,
            level_1: {attribute: :survey_id},
            level_2: {attribute: :question_id}
            # level_3: {attribute: :id}

  end

end
