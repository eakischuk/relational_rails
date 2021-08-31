class GymMember < ApplicationRecord
  belongs_to :climbing_gym

  def full_name
    "#{first_name} #{last_name}"
  end
end
