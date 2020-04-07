class Meter < ApplicationRecord
  has_one :water,dependent: :destroy
  has_many :customers,dependent: :restrict_with_error
  accepts_nested_attributes_for :water,:allow_destroy => true
  belongs_to :gpr
  scope :recent, -> { order(name:  :desc) }
  scope :older, -> { where(name: "%1%") }
end
