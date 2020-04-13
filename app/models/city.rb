class City < ApplicationRecord
  belongs_to :region
  has_and_belongs_to_many :plans,:join_table=> :plans_cities
end
