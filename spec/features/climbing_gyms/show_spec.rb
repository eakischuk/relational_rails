require 'rails_helper'

RSpec.describe 'climbing gym show page', type: :feature do
  before(:each) do
    @et = ClimbingGym.create!(name: "EarthTreks", ropes: true, total_routes: 200, updated_at: '2021-08-26 01:11:07 UTC', created_at: '2021-08-26 01:11:07 UTC')
    @movement = ClimbingGym.create!(name: "Movement RiNo", ropes: false, total_routes: 70, updated_at: '2021-08-27 01:11:07 UTC', created_at: '2021-08-27 01:11:07 UTC')
    @dbc = ClimbingGym.create!(name: "Denver Bouldering Club", ropes: false, total_routes: 85, updated_at: '2021-08-26 01:12:07 UTC', created_at: '2021-08-26 02:11:07 UTC')
    @amy = GymMember.create!(climbing_gym: @et, first_name: "Amy", last_name: "Santiago", belay_status: true, monthly_checkins: 12)
    @jake = GymMember.create!(climbing_gym: @et, first_name: "Jake", last_name: "Peralta", belay_status: false, monthly_checkins: 3)
    @rosa = GymMember.create!(climbing_gym: @movement, first_name: "Rosa", last_name: "Diaz", belay_status: true, monthly_checkins: 14)
  end

  describe 'display of records and attributes' do
    it 'displays the gym name' do
      visit "/climbing_gyms/#{@et.id}"

      expect(page).to have_content("EarthTreks")
    end

    it 'displays if the gym has ropes' do
      visit "/climbing_gyms/#{@et.id}"
      expect(page).to have_content("Ropes: true")

      visit "/climbing_gyms/#{@dbc.id}"
      expect(page).to have_content("Ropes: false")
    end

    it 'displays number of routes' do
      visit "/climbing_gyms/#{@et.id}"

      expect(page).to have_content("Number of Routes: 200")
    end

    it 'displays number of members associated' do
      visit "/climbing_gyms/#{@et.id}"
      expect(page).to have_content("Total Members: 2")

      visit "/climbing_gyms/#{@dbc.id}"
      expect(page).to have_content("Total Members: 0")
    end
  end

  describe 'links and buttons' do
    it 'has link to all members' do
      visit "/climbing_gyms/#{@et.id}"

      click_on 'All Gym Members'
      expect(current_path).to eq('/gym_members')
    end

    it 'has all gyms link' do
      visit "/climbing_gyms/#{@et.id}"

      click_on 'Climbing Gyms'
      expect(current_path).to eq('/climbing_gyms')
    end

    it 'has gym specific members link' do
      visit "/climbing_gyms/#{@et.id}"

      click_on "#{@et.name} Members"
      expect(current_path).to eq("/climbing_gyms/#{@et.id}/gym_members")

      visit "/climbing_gyms/#{@dbc.id}"

      click_on "#{@dbc.name} Members"
      expect(current_path).to eq("/climbing_gyms/#{@dbc.id}/gym_members")
    end
  end
end
