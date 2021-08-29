require 'rails_helper'

RSpec.describe GymMember do
  it {should belong_to :climbing_gym}

  it 'has full name' do
    @et = ClimbingGym.create!(name: "EarthTreks", ropes: true, total_routes: 200)
    @amy = GymMember.create!(climbing_gym: @et, first_name: "Amy", last_name: "Santiago", belay_status: true, monthly_checkins: 12)

    expect(@amy.full_name).to eq("Amy Santiago")
  end
end
