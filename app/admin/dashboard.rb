ActiveAdmin.register_page "Dashboard" do
  menu parent: '设备管理'
  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: " dashboard_default_message" ,style: 'width:400;height:400;' do
      para   geo_chart City.group(:name).count

    end
    div do
      para  column_chart Gpr.group_by_day(:created_at, format: "%a").count,download: {filename: "boom.png"}
    end
    div do
      para  column_chart Order.group_by_day(:created_at, format: "%a").count
    end
  end # content

  def api_authentication
    api_key = request.headers['Api-Key']
    @app = Application.find_by_api_key(api_key) if api_key
    unless @app
      return render json: { errors: { message: 'Something went wrong, contact admin', code: '1000' } }
    end
  end
end
