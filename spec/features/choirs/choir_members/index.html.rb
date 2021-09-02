require 'rails_helper'

RSpec.describe 'Choir members index' do
  before(:each) do
    @divo = Choir.create!(name: "Divo", openings: 2, active: true)
    @volcestra = Choir.create!(name: "Volcestra", openings: 1, active: true)
    @patrick = ChoirMember.create!(choir: @volcestra, name: "Patrick Star", age: 32, active: true, voice_type: "Tenor")
    @santiago = ChoirMember.create!(choir: @volcestra, name: "Santiago King", age: 344, active: true, voice_type: "Tenor")

  end

  it 'displays all members for he choir' do
    visit "/choirs/#{@volcestra.id}/choir_members"

    expect(page).to have_content(@patrick.name)
    expect(page).to have_content(@santiago.name)

  end
  it 'limits records in page of by age' do

    visit "/choirs/#{@volcestra.id}/choir_members"

    fill_in('Minimum age', with: 33)
    click_on "Only Return Members Older Than Minimum Age"
    expect(current_path).to eq("choirs/#{@volcestra.id}/choir_members")
    expect(page).to have_content("Santiago King")
    expect(page).to_not have_content("Patrick Star")
  end
end
