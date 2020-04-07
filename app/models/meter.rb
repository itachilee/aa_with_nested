class Meter < ApplicationRecord
  has_one :water,dependent: :destroy
  accepts_nested_attributes_for :water,:allow_destroy => true
  belongs_to :gpr
end
