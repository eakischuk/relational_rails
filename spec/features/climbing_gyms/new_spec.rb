require 'rails_helper'

RSpec.describe 'new gym form', type: :feature do
  it 'has new gym link' do
    visit "/climbing_gyms"

    click_on "New Climbing Gym"
    expect(current_path).to eq("/climbing_gyms/new")
  end

  it 'can create a new climbing gym' do
    visit '/climbing_gyms/new'

    fill_in('Name', with: 'Planet Granite')
    choose('Ropes')
    fill_in('Total routes', with: 250)
    click_button('Create Climbing Gym')

    expect(current_path).to eq("/climbing_gyms")
    expect(page).to have_content("Planet Granite")
  end
end
