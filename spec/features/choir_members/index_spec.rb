require 'rails_helper'

RSpec.describe 'Choir Members index' do
  before(:each) do
    @divo = Choir.create!(name: "Divo", openings: 2, active: true)
    @volcestra = Choir.create!(name: "Volcestra", openings: 1, active: true)
    @lucy = ChoirMember.create!(choir: @divo, name: "Lucy Perez", age: 34, active: true, voice_type: "Soprano")
    @respi = ChoirMember.create!(choir: @volcestra, name: "Respi Luz", age: 28, active: true, voice_type: "Alto")
  end

  it 'displays member names' do
    visit '/choir_members'

    expect(page).to have_content(@lucy.name)
    expect(page).to have_content(@respi.name)
  end

  it 'displays corresponding choir' do
    visit '/choir_members'

    expect(page).to have_content("Choir: #{@lucy.choir.name}")
    expect(page).to have_content("Choir: #{@respi.choir.name}")
  end

  it 'displays member ages' do
    visit '/choir_members'

    expect(page).to have_content("Age: #{@lucy.age}")
    expect(page).to have_content("Age: #{@respi.age}")
  end

  it 'displays member active status' do
    visit '/choir_members'

    expect(page).to have_content("Active: #{@lucy.active}")
    expect(page).to have_content("Active: #{@respi.active}")
  end

  it 'displays member voice type' do
    visit '/choir_members'

    expect(page).to have_content("Voice Type: #{@lucy.voice_type}")
    expect(page).to have_content("Voice Type: #{@respi.voice_type}")
  end

  it 'has a link to all choirs' do
    visit '/choir_members'

    click_on 'All Choirs'
    expect(current_path).to eq('/choirs')
  end

  it 'has a link to all choir members' do
    visit '/choir_members'

    expect(page).to have_link('All Choir Members')
    expect(page).to_not have_button('All Choir Members')

    click_on 'All Choir Members'
    expect(current_path).to eq('/choir_members')
  end
end
