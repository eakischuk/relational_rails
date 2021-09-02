require 'rails_helper'

RSpec.describe 'edit choir member form', type: :feature do
  before(:each) do
    # @divo = Choir.create!(name: "Divo", openings: 2, active: true, updated_at: '2021-08-26 01:11:07 UTC', created_at: '2021-08-26 01:11:07 UTC')
    @volcestra = Choir.create!(name: "Volcestra", openings: 1, active: true, updated_at: '2021-08-27 01:11:07 UTC', created_at: '2021-08-27 01:11:07 UTC')
    @patrick = ChoirMember.create!(name: "Patrick Star", age: 32, active: true, voice_type: "Tenor", choir: @volcestra)
    @santiago = ChoirMember.create!(name: "Santiago King", age: 344, active: true, voice_type: "Tenor", choir: @volcestra)
  end

  it 'has update member link' do
    visit "/choir_members/#{@patrick.id}"

    click_on "Update"
    expect(current_path).to eq("/choir_members/#{@patrick.id}/edit")
  end
end
