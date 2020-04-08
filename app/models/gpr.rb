class Gpr < ApplicationRecord
  has_many :meters
  has_many :collectors
end
