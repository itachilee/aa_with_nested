class Factory < ApplicationRecord
  has_many :meters

  scope :sorted,->{order(created_at: :desc)}
  scope :init_with_a,->{where(name: '%a%')}
end
