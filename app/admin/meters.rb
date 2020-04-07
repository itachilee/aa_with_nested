ActiveAdmin.register Meter do
  menu parent: 'device'
  scope :all
  scope :older
  scope :recent
  permit_params :name, :no,:gpr_id, water_attributes: [:name,:no]
  action_item :view, only: :index do
    link_to 'View on site', "#"
  end

  index do
    selectable_column
    column :name
    column :no
    column :gpr_id  do|t|
      link_to t.gpr.name,admin_gpr_path(t.gpr_id) if t&.gpr_id.present?
    end
    column "waters" do |t|
      link_to t.water.no,admin_water_path(t.water.id) if t.water.present?
    end
    column "cutomers" do |t|
      t.customers.map{|c| link_to c.name ,admin_customer_path(c.id)}
    end
    column "collector" do|t|
      Collector.find(t.gpr_id ) if t&.gpr_id
    end
    actions
  end
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
