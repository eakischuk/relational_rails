require 'rails_helper'

RSpec.describe 'Cimbing Gym index', type: :feature do
  before(:each) do
    @et = ClimbingGym.create!(name: "EarthTreks", ropes: true, total_routes: 200)
    @movement = ClimbingGym.create!(name: "Movement RiNo", ropes: false, total_routes: 70)
    @dbc = ClimbingGym.create!(name: "Denver Bouldering Club", ropes: false, total_routes: 85)
  end
  it 'can see all climging gym names' do
    visit "/climbing_gyms"

    expect(page).to have_content(@et.name)
    expect(page).to have_content(@movement.name)
  end

  it 'shows in order of creation date' do
    visit "/climbing_gyms"

    expect("Movement RiNo").to appear_before("EarthTreks", only_text: true)
    expect("Denver Bouldering Club").to appear_before("Movement RiNo", only_text: true)
  end

  it 'shows creation date next to name' do
    visit "/climbing_gyms"

    expect(page).to have_content("Movement RiNo - Date Created: #{@movement.created_at}")
    expect(page).to have_content("EarthTreks - Date Created: #{@et.created_at}")
    expect(page).to have_content("Denver Bouldering Club - Date Created: #{@dbc.created_at}")
    expect("#{@dbc.name}").to appear_before("#{@dbc.created_at}", only_text: true)
    expect("Denver Bouldering Club - Date Created: #{@dbc.created_at}").to appear_before("EarthTreks - Date Created: #{@et.created_at}", only_text: true)
  end

  it 'has all members link' do
    visit "/climbing_gyms"

    click_on 'All Gym Members'
    expect(current_path).to eq('/gym_members')
  end
end
