class GymMember < ApplicationRecord
  belongs_to :climbing_gym

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.checkin_min(filter = nil)
    if filter == nil
      filter = 0
      where("monthly_checkins > #{filter}")
    else
      where("monthly_checkins > #{filter}")
    end
  end
end
