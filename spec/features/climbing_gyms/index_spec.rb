require 'rails_helper'

RSpec.describe 'Cimbing Gym index' do
  it 'can see all climging gym names' do
    et = ClimbingGym.create!(name: "EarthTreks", ropes: true, total_routes: 200)
    movement = ClimbingGym.create!(name: "Movement RiNo", ropes: false, total_routes: 70)

    visit "/climbing_gyms"

    expect(page).to have_content(et.name)
    expect(page).to have_content(movement.name)
  end
  
end
