class ClimbingGym < ApplicationRecord
  has_many :gym_members

  def self.order_by_creation
    self.all.order(created_at: :desc)
  end
end
