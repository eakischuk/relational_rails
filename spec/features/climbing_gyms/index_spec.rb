require 'rails_helper'

RSpec.describe 'Cimbing Gym index', type: :feature do
  before(:each) do
    @et = ClimbingGym.create!(name: "EarthTreks", ropes: true, total_routes: 200, created_at: "2021-08-01 22:03:19 UTC")
    @movement = ClimbingGym.create!(name: "Movement RiNo", ropes: false, total_routes: 70)
    @dbc = ClimbingGym.create!(name: "Denver Bouldering Club", ropes: false, total_routes: 85)
  end
  describe 'display' do
    it 'can see all climbing gym names' do
      visit "/climbing_gyms"

      expect(page).to have_content(@et.name)
      expect(page).to have_content(@movement.name)
    end
  end

  describe 'order by creation date' do
    it 'shows in order of creation date' do
      visit "/climbing_gyms"

      expect("Movement RiNo").to appear_before("EarthTreks", only_text: true)
      expect("Denver Bouldering Club").to appear_before("Movement RiNo", only_text: true)
    end

    it 'shows creation date next to name' do
      visit "/climbing_gyms"

      expect(page).to have_content("Date Created: #{@movement.created_at}")
      expect(page).to have_content("Date Created: #{@et.created_at}")
      expect(page).to have_content("Date Created: #{@dbc.created_at}")
      expect("#{@dbc.name}").to appear_before("#{@dbc.created_at}", only_text: true)
      expect("Date Created: #{@dbc.created_at}").to appear_before("Date Created: #{@et.created_at}", only_text: true)
    end
  end

  describe 'page links' do
    it 'has all members link' do
      visit "/climbing_gyms"

      click_on 'All Gym Members'
      expect(current_path).to eq('/gym_members')
    end

    it 'has update buttons for each gym' do
      visit "/climbing_gyms"
      click_on 'Update EarthTreks'
      expect(current_path).to eq("/climbing_gyms/#{@et.id}/edit")

      visit "/climbing_gyms"
      click_on 'Update Movement RiNo'
      expect(current_path).to eq("/climbing_gyms/#{@movement.id}/edit")

      visit "/climbing_gyms"
      click_on 'Update Denver Bouldering Club'
      expect(current_path).to eq("/climbing_gyms/#{@dbc.id}/edit")
    end
  end
end
