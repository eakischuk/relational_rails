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
    expect("#{@divo.name}").to appear_before("#{@volcestra.created_at}", only_text: true)
    expect("Divo - Date Created: #{@divo.created_at}").to appear_before("Volcestra - Date Created: #{@volcestra.created_at}", only_text: true)
  end
end
