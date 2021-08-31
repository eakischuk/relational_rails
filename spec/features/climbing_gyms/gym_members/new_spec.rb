require 'rails_helper'

RSpec.describe 'new gym member form', type: :feature do
  before(:each) do
    @et = ClimbingGym.create!(name: "EarthTreks", ropes: true, total_routes: 200)
    @movement = ClimbingGym.create!(name: "Movement RiNo", ropes: false, total_routes: 70)
    @amy = GymMember.create!(climbing_gym: @et, first_name: "Amy", last_name: "Santiago", belay_status: true, monthly_checkins: 12)
    @jake = GymMember.create!(climbing_gym: @et, first_name: "Jake", last_name: "Peralta", belay_status: false, monthly_checkins: 3)
    @rosa = GymMember.create!(climbing_gym: @movement, first_name: "Rosa", last_name: "Diaz", belay_status: true, monthly_checkins: 14)
  end
  it 'has new gym member link' do
    visit "/climbing_gyms/#{@et.id}/gym_members"

    click_on "Create Gym Member"
    expect(current_path).to eq("/climbing_gyms/#{@et.id}/gym_members/new")
  end

  it 'can create a new climbing gym member' do
    visit "/climbing_gyms/#{@et.id}/gym_members/new"

    fill_in('First Name', with: 'Raymond')
    fill_in('Last Name', with: 'Holt')
    choose('True')
    fill_in('Monthly Check-ins', with: 17)
    click_button('Create Gym Member')

    expect(current_path).to eq("/climbing_gyms/#{@et.id}/gym_members")
    expect(page).to have_content("Raymond Holt")
  end
end
