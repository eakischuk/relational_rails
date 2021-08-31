require 'rails_helper'

RSpec.describe 'edit gym form', type: :feature do
  before(:each) do
    @et = ClimbingGym.create!(name: "EarthTreks", ropes: true, total_routes: 200)
    @movement = ClimbingGym.create!(name: "Movement RiNo", ropes: false, total_routes: 70)
  end
  it 'has update gym link' do
    visit "/climbing_gyms/#{@et.id}"

    click_on "Update #{@et.name}"
    expect(current_path).to eq("/climbing_gyms/#{@et.id}/edit")
  end

  it 'can update a climbing gym' do
    visit "/climbing_gyms/#{@et.id}/edit"


    choose('No Ropes')
    fill_in('Total routes', with: 300)
    click_button("Update #{@et.name}")

    expect(current_path).to eq("/climbing_gyms/#{@et.id}")
    expect(page).to have_content("EarthTreks")
    expect(page).to have_content("Number of Routes: 300")
    expect(page).to have_content("Ropes: false")
  end

  it 'makes no changes without input' do
    visit "/climbing_gyms/#{@movement.id}/edit"

    click_button("Update #{@movement.name}")
    expect(current_path).to eq("/climbing_gyms/#{@movement.id}")
    expect(page).to have_content("Movement RiNo")
    expect(page).to have_content("Number of Routes: 70")
    expect(page).to have_content("Ropes: false")
  end
end
