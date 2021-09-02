require 'rails_helper'

RSpec.describe 'Choirs show page', type: :feature do
  before(:each) do
    @divo = Choir.create!(name: "Divo", openings: 2, active: true, updated_at: '2021-08-26 01:11:07 UTC', created_at: '2021-08-26 01:11:07 UTC')
    @volcestra = Choir.create!(name: "Volcestra", openings: 1, active: true, updated_at: '2021-08-27 01:11:07 UTC', created_at: '2021-08-27 01:11:07 UTC')
    # @patrick = ChoirMember.create!(name: "Patrick Star", age: 32, active: true, voice_type: "Tenor")
    # @santiago = ChoirMember.create!(name: "Santiago King", age: 344, active: true, voice_type: "Tenor")
  end

  it 'displays the choir ' do
    visit "/choirs/#{@divo.id}"

    expect(page).to have_content("Choir")
  end

  it 'displays the choir name' do
    visit "/choirs/#{@divo.id}"

    expect(page).to have_content("Divo")
  end

  it 'displays openings' do
    visit "/choirs/#{@divo.id}"

    expect(page).to have_content("Openings")
  end

  it 'displays if choir is active' do
    visit "/choirs/#{@divo.id}"

    expect(page).to have_content("Active")
  end

  it 'displays total members' do
    visit "/choirs/#{@divo.id}"

    expect(page).to have_content("Total Members")
  end

  it 'has link to all choir members' do
    visit "/choirs/#{@divo.id}"

    click_on 'All Choir Members'
    expect(current_path).to eq('/choir_members')
  end

  it 'has link to all choirs' do
    visit "/choirs/#{@divo.id}"

    click_on 'Choirs'
    expect(current_path).to eq('/choirs')
  end

  it 'has gym specific members link' do
   visit "/choirs/#{@divo.id}"

   click_on "See Members"
   expect(current_path).to eq("/choirs/#{@divo.id}/choir_members")
 end
end
