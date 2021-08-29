require 'rails_helper'

RSpec.describe 'welcome' do
  it 'has welcome page' do
    visit '/'

    expect(page).to have_content('Memberships')
    expect(page).to have_content('Choirs')
    expect(page).to have_content('Climbing Gyms')
  end

  it 'has parent index links' do
    visit '/'
    click_on 'Choirs'
    expect(current_path).to eq('/choirs')

    visit '/'
    click_on 'Climbing Gyms'
    expect(current_path).to eq('/climbing_gyms')
  end

  it 'has child index links' do
    visit '/'
    
    click_on 'All Gym Members'
    expect(current_path).to eq('/gym_members')
  end
end
