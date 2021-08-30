require 'rails_helper'

RSpec.describe 'Gym Members index' do
  before(:each) do
    @et = ClimbingGym.create!(name: "EarthTreks", ropes: true, total_routes: 200)
    @movement = ClimbingGym.create!(name: "Movement RiNo", ropes: false, total_routes: 70)
    @amy = GymMember.create!(climbing_gym: @et, first_name: "Amy", last_name: "Santiago", belay_status: true, monthly_checkins: 12)
    @jake = GymMember.create!(climbing_gym: @et, first_name: "Jake", last_name: "Peralta", belay_status: false, monthly_checkins: 3)
    @rosa = GymMember.create!(climbing_gym: @movement, first_name: "Rosa", last_name: "Diaz", belay_status: true, monthly_checkins: 14)
  end

  it 'displays member names' do
    visit '/gym_members'

    expect(page).to have_content(@amy.full_name)
    expect(page).to have_content(@jake.full_name)
    expect(page).to have_content(@rosa.full_name)
  end

  it 'displays home gym' do
    visit '/gym_members'

    expect(page).to have_content("Home Gym: #{@amy.climbing_gym.name}")
    expect(page).to have_content("Home Gym: #{@jake.climbing_gym.name}")
    expect(page).to have_content("Home Gym: #{@rosa.climbing_gym.name}")
  end

  it 'displays belay status' do
    visit '/gym_members'

    expect(page).to have_content("Belay Certified: #{@amy.belay_status}")
    expect(page).to have_content("Belay Certified: #{@jake.belay_status}")
    expect(page).to have_content("Belay Certified: #{@rosa.belay_status}")
  end

  it 'displays check-in count' do
    visit '/gym_members'

    expect(page).to have_content("Monthly Check-ins: #{@amy.monthly_checkins}")
    expect(page).to have_content("Monthly Check-ins: #{@jake.monthly_checkins}")
    expect(page).to have_content("Monthly Check-ins: #{@rosa.monthly_checkins}")
  end

  it 'has all gyms link' do
    visit '/gym_members'

    click_on 'Climbing Gyms'
    expect(current_path).to eq('/climbing_gyms')
  end
end
