require 'rails_helper'

RSpec.describe 'edit gym member form', type: :feature do
  before(:each) do
    @et = ClimbingGym.create!(name: "EarthTreks", ropes: true, total_routes: 200)
    @movement = ClimbingGym.create!(name: "Movement RiNo", ropes: false, total_routes: 70)
    @amy = GymMember.create!(climbing_gym: @et, first_name: "Amy", last_name: "Santiago", belay_status: true, monthly_checkins: 12)
    @jake = GymMember.create!(climbing_gym: @et, first_name: "Jake", last_name: "Peralta", belay_status: false, monthly_checkins: 3)
    @rosa = GymMember.create!(climbing_gym: @movement, first_name: "Rosa", last_name: "Diaz", belay_status: true, monthly_checkins: 14)
  end
  it 'has update member link' do
    visit "/gym_members/#{@amy.id}"

    click_on "Update #{@amy.full_name}"
    expect(current_path).to eq("/gym_members/#{@amy.id}/edit")
  end

  it 'can update a gym member' do
    visit "/gym_members/#{@amy.id}/edit"


    choose('Not Belay Certified')
    # save_and_open_page
    fill_in('Monthly checkins', with: 4)
    click_button("Update #{@amy.full_name}")

    expect(current_path).to eq("/gym_members/#{@amy.id}")
    expect(page).to have_content("Amy Santiago")
    expect(page).to have_content("Monthly Check-ins: 4")
    expect(page).to have_content("Belay Certified: false")
  end

  it 'makes no changes without input' do
    visit "/gym_members/#{@rosa.id}/edit"

    click_button("Update #{@rosa.full_name}")
    expect(current_path).to eq("/gym_members/#{@rosa.id}")
    expect(page).to have_content("Rosa Diaz")
    expect(page).to have_content("Monthly Check-ins: 14")
    expect(page).to have_content("Belay Certified: true")
  end
end
