class Survey < ApplicationRecord
  has_many :questions,dependent: :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true
  has_many :answers,through: :questions
  validates_associated :questions


end
