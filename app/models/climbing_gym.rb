class ClimbingGym < ApplicationRecord
  has_many :gym_members, :dependent => :destroy

  def self.order_by_creation
    all.order(created_at: :desc)
  end

  def member_count
    gym_members.count
  end

  def sort_members(order = false)
    if order == 'alphabet'
      gym_members.order(:first_name, :last_name)
    else
      gym_members
    end
  end
end
