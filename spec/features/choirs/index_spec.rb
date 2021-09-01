require 'rails_helper'

RSpec.describe 'the choirs home page', type: :feature do
  before(:each) do
    @divo = Choir.create!(name: "Divo", openings: 2, active: true)
    @volcestra = Choir.create!(name: "Volcestra", openings: 1, active: true)
  end

  it 'can see all choir names' do
    visit "/choirs"

    expect(page).to have_content(@divo.name)
    expect(page).to have_content(@volcestra.name)
  end

  it 'shows creation date next to name' do
    visit "/choirs"

    expect(page).to have_content("Divo - Date Created: #{@divo.created_at}")
    expect(page).to have_content("Volcestra - Date Created: #{@volcestra.created_at}")
    expect("Volcestra - Date Created: #{@volcestra.created_at}").to appear_before("Divo - Date Created: #{@divo.created_at}", only_text: true)
  end

  it 'shows creation date' do
    visit "/choirs"

    expect(page).to have_content("Volcestra - Date Created: #{@volcestra.created_at}")
    expect(page).to have_content("Divo - Date Created: #{@divo.created_at}")
    expect("#{@volcestra.name}").to appear_before("#{@divo.created_at}", only_text: true)
    expect("Volcestra - Date Created: #{@volcestra.created_at}").to appear_before("Divo - Date Created: #{@divo.created_at}", only_text: true)
  end

  it 'has all members link' do
    visit "/choirs"

    click_on 'All Choir Members'
    expect(current_path).to eq('/choir_members')
  end

  it 'has update buttons for each choir' do
    visit "/choirs"
    click_on 'Update Volcestra'
    expect(current_path).to eq("/choirs/#{@volcestra.id}/edit")

    visit "/choirs"
    click_on 'Update Divo'
    expect(current_path).to eq("/choirs/#{@divo.id}/edit")
  end
end
