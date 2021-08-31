require 'rails_helper'

RSpec.describe 'deletes gym member' do
  before(:each) do
    @et = ClimbingGym.create!(name: "EarthTreks", ropes: true, total_routes: 200)
    @movement = ClimbingGym.create!(name: "Movement RiNo", ropes: false, total_routes: 70)
    @jake = GymMember.create!(climbing_gym: @et, first_name: "Jake", last_name: "Peralta", belay_status: true, monthly_checkins: 3)
    @amy = GymMember.create!(climbing_gym: @et, first_name: "Amy", last_name: "Santiago", belay_status: true, monthly_checkins: 12)
    @rosa = GymMember.create!(climbing_gym: @movement, first_name: "Rosa", last_name: "Diaz", belay_status: true, monthly_checkins: 14)
  end

  it 'deletes gym member' do
    visit "/gym_members/#{@jake.id}"

    click_on "Delete #{@jake.full_name}"
    expect(current_path).to eq("/gym_members")
    expect(page).to_not have_content("Jake Peralta")
    expect(page).to have_content("Rosa Diaz")
    expect(page).to have_content("Amy Santiago")
  end
end
