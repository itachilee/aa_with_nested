class Meter < ApplicationRecord
  has_one :water, dependent: :destroy
  has_many :customers, dependent: :restrict_with_error
  belongs_to :gpr
  belongs_to :factory
  accepts_nested_attributes_for :water, :allow_destroy => true
  scope :recent, -> { order(name: :desc) }
  scope :older, -> { where(name: "%1%") }
end
