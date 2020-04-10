ActiveAdmin.register Meter do
  menu parent: '设备管理'
  scope :all
  scope :older
  scope :recent
  permit_params :name, :no,:gpr_id,:factory_id, water_attributes: [:name,:no]
  # action_item :view, only: :index do
  #   flash[:notice] = "successfully created meter"
  #   link_to 'View on site', "#"
  # end

  index do
    selectable_column
    column :name
    column :no
    column :gpr_id  do|t|
      link_to t.gpr.name,admin_gpr_path(t.gpr_id) if t&.gpr_id.present?
    end
    column :water do |t|
      link_to t.water.no,admin_water_path(t.water.id) if t.water.present?
    end
    column :customers do |t|
      t.customers.map{|c| link_to c.name ,admin_customer_path(c.id)}
    end
    column :collector do|t|
      Collector.find(t.gpr_id ) if t.gpr_id.present?
    end
    column :factory do|t|
      link_to t.factory.name,admin_factory_path(t.id) if t.factory_id.present?
    end
    actions
  end
  form do|f|
    f.inputs "基本信息" do
      f.input :name
      f.input :no

    end
    f.inputs "关联信息" do
      f.input :gpr_id,as: :select,collection: Gpr.all.map{|g| [g.no,g.id]}
      f.input :factory_id,as: :select,collection: Factory.all.map{|g| [g.name,g.id]}
      f.has_many :water,class: 'has_one' do |t|
        t.input :name,label: '名称'
        t.input :no
      end
    end
    f.actions
  end



end
