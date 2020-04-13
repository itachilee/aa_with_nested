class CreatePlanWithCities < ActiveRecord::Migration[5.2]
  def change


    create_table :plans do|t|
      t.string :plan_name
      t.timestamps
    end
    create_table :plans_cities do |t|
      t.belongs_to :city
      t.belongs_to :plan
    end
  end
end
