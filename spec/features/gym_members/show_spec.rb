require 'rails_helper'

RSpec.describe 'Gym Members show page' do
  before(:each) do
    @et = ClimbingGym.create!(name: "EarthTreks", ropes: true, total_routes: 200)
    @movement = ClimbingGym.create!(name: "Movement RiNo", ropes: false, total_routes: 70)
    @amy = GymMember.create!(climbing_gym: @et, first_name: "Amy", last_name: "Santiago", belay_status: true, monthly_checkins: 12)
    @jake = GymMember.create!(climbing_gym: @et, first_name: "Jake", last_name: "Peralta", belay_status: false, monthly_checkins: 3)
    @rosa = GymMember.create!(climbing_gym: @movement, first_name: "Rosa", last_name: "Diaz", belay_status: true, monthly_checkins: 14)
  end

  it 'displays the gym members name' do
    visit "/gym_members/#{@amy.id}"
    expect(page).to have_content(@amy.full_name)

    visit "/gym_members/#{@rosa.id}"
    expect(page).to have_content(@rosa.full_name)
  end

  it 'displays the gym members home gym' do
    visit "/gym_members/#{@amy.id}"
    expect(page).to have_content("Home Gym: #{@amy.climbing_gym.name}")

    visit "/gym_members/#{@rosa.id}"
    expect(page).to have_content("Home Gym: #{@rosa.climbing_gym.name}")
  end

  it 'displays the gym members belay status' do
    visit "/gym_members/#{@amy.id}"
    expect(page).to have_content("Belay Certified: #{@amy.belay_status}")

    visit "/gym_members/#{@rosa.id}"
    expect(page).to have_content("Belay Certified: #{@rosa.belay_status}")
  end

  it 'displays monthly check-ins' do
    visit "/gym_members/#{@amy.id}"
    expect(page).to have_content("Monthly Check-ins: #{@amy.monthly_checkins}")

    visit "/gym_members/#{@rosa.id}"
    expect(page).to have_content("Monthly Check-ins: #{@rosa.monthly_checkins}")
  end
end
