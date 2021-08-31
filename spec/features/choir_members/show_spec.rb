require 'rails_helper'

RSpec.describe 'Choir Members show' do
  before(:each) do
    @divo = Choir.create!(name: "Divo", openings: 2, active: true)
    @volcestra = Choir.create!(name: "Volcestra", openings: 1, active: true)
    @lucy = ChoirMember.create!(choir: @divo, name: "Lucy Perez", age: 34, active: true, voice_type: "Soprano")
    @respi = ChoirMember.create!(choir: @volcestra, name: "Respi Luz", age: 28, active: true, voice_type: "Alto")
  end

  it 'displays choir member name' do
    visit "/choir_members/#{@lucy.id}"
    expect(page).to have_content(@lucy.name)

    visit "/choir_members/#{@respi.id}"
    expect(page).to have_content(@respi.name)
  end

  it 'displays choir member age' do
    visit "/choir_members/#{@lucy.id}"
    expect(page).to have_content(@lucy.age)

    visit "/choir_members/#{@respi.id}"
    expect(page).to have_content(@respi.age)
  end

  it 'displays choir member active status' do
    visit "/choir_members/#{@lucy.id}"
    expect(page).to have_content(@lucy.active)

    visit "/choir_members/#{@respi.id}"
    expect(page).to have_content(@respi.active)
  end

  it 'displays choir member voice type' do
    visit "/choir_members/#{@lucy.id}"
    expect(page).to have_content(@lucy.voice_type)

    visit "/choir_members/#{@respi.id}"
    expect(page).to have_content(@respi.voice_type)
  end

  it 'displays choir member choir' do
    visit "/choir_members/#{@lucy.id}"
    expect(page).to have_content(@lucy.choir.name)

    visit "/choir_members/#{@respi.id}"
    expect(page).to have_content(@respi.choir.name)
  end

  it 'has all choir members link' do
    visit "/choir_members/#{@lucy.id}"

    click_on 'All Choir Members'
    expect(current_path).to eq('/choir_members')
  end

  it 'has all choirs link' do
    visit "/choir_members/#{@lucy.id}"

    click_on 'All Choirs'
    expect(current_path).to eq('/choirs')
  end
end
