class Plan < ApplicationRecord

  has_and_belongs_to_many :cities,:join_table=> :plans_cities
end
