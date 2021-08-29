require 'rails_helper'

RSpec.describe 'Climbing Gym members index' do
  before(:each) do
    @et = ClimbingGym.create!(name: "EarthTreks", ropes: true, total_routes: 200)
    @movement = ClimbingGym.create!(name: "Movement RiNo", ropes: false, total_routes: 70)
    @amy = GymMember.create!(climbing_gym: @et, first_name: "Amy", last_name: "Santiago", belay_status: true, monthly_checkins: 12)
    @jake = GymMember.create!(climbing_gym: @et, first_name: "Jake", last_name: "Peralta", belay_status: false, monthly_checkins: 3)
    @rosa = GymMember.create!(climbing_gym: @movement, first_name: "Rosa", last_name: "Diaz", belay_status: true, monthly_checkins: 14)
  end

  it 'shows all member names for the gym' do
    visit "/climbing_gyms/#{@et.id}/gym_members"

    expect(page).to have_content(@amy.full_name)
    expect(page).to have_content(@jake.full_name)

    visit "/climbing_gyms/#{@movement.id}/gym_members"

    expect(page).to have_content(@rosa.full_name)
  end

  it 'shows all members belay status' do
    visit "/climbing_gyms/#{@et.id}/gym_members"
    expect(page).to have_content("Belay Certified: #{@amy.belay_status}")
    expect(page).to have_content("Belay Certified: #{@jake.belay_status}")

    visit "/climbing_gyms/#{@movement.id}/gym_members"
    expect(page).to have_content("Belay Certified: #{@rosa.belay_status}")
  end

  it 'shows all members monthly check in' do
    visit "/climbing_gyms/#{@et.id}/gym_members"
    expect(page).to have_content("Monthly Check-ins: #{@amy.monthly_checkins}")
    expect(page).to have_content("Monthly Check-ins: #{@jake.monthly_checkins}")

    visit "/climbing_gyms/#{@movement.id}/gym_members"
    expect(page).to have_content("Monthly Check-ins: #{@rosa.monthly_checkins}")
  end
end
