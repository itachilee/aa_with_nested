ActiveAdmin.register Survey do


  permit_params :name, questions_attributes: [:content, :_destroy]


  form decorate: true do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "form" do
      f.input :name

    end
    f.inputs do
      f.has_many :questions do |t|
        t.input :content
        t.input :_destroy, :as => :boolean, :required => false, :label => 'Remove'
      end
    end
    f.actions
  end
  index do
    selectable_column
    column :name
    column "questions" do |t|
      t.questions.map { |q| q.content }.join(',')
    end
    actions
  end

end
