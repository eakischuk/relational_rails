require 'rails_helper'

Rspec.describe 'new choir page', type: :feature do
  it 'has new choir link' do
    visit "/choirs"

    click_on "Create New Choir"
    expect(current_path).to eq("/choirs/new")
  end

  it 'can create a new choir' do
    visit '/choirs/new'

    fill_in('Name', with: 'Harmony')
    fill_in('Openings', with: 0)
    choose('Active')
    click_button('Create New Choir')

    expect(current_path).to eq("/choirs")
    expect(page).to have_content("Harmony")
  end
end
