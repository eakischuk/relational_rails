require 'rails_helper'

RSpec.describe 'climbing gym show page' do
  before(:each) do
    @et = ClimbingGym.create!(name: "EarthTreks", ropes: true, total_routes: 200)
    @movement = ClimbingGym.create!(name: "Movement RiNo", ropes: false, total_routes: 70)
  end
  
  it 'displays the gym name' do
    visit "/climbing_gyms/#{@et.id}"

    expect(page).to have_content("EarthTreks")
  end

  it 'displays if the gym has ropes' do
    visit "/climbing_gyms/#{@et.id}"

    expect(page).to have_content("Ropes: true")
  end

  it 'displays number of routes' do
    visit "/climbing_gyms/#{@et.id}"

    expect(page).to have_content("Number of Routes: 200")
  end
end
