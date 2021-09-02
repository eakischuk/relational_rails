require 'rails_helper'

RSpec.describe 'edit choir form' do
  before(:each) do
    @divo = Choir.create!(name: "Divo", openings: 2, active: true)
    @volcestra = Choir.create!(name: "Volcestra", openings: 1, active: true)
  end

  it 'has update choir link' do
    visit "/choirs/#{@divo.id}"

    click_on "Update #{@divo.name}"
    expect(current_path).to eq("/choirs/#{@divo.id}/edit")
  end
end
