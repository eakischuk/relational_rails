require 'rails_helper'

RSpec.describe 'Gym Members index' do
  before(:each) do
    @et = ClimbingGym.create!(name: "EarthTreks", ropes: true, total_routes: 200)
    @movement = ClimbingGym.create!(name: "Movement RiNo", ropes: false, total_routes: 70)
    @amy = GymMember.create!(climbing_gym: @et, first_name: "Amy", last_name: "Santiago", belay_status: true, monthly_checkins: 12)
    @jake = GymMember.create!(climbing_gym: @et, first_name: "Jake", last_name: "Peralta", belay_status: false, monthly_checkins: 3)
    @rosa = GymMember.create!(climbing_gym: @movement, first_name: "Rosa", last_name: "Diaz", belay_status: true, monthly_checkins: 14)
  end
  describe 'belay certified members' do
    it 'displays member names' do
      visit '/gym_members'

      expect(page).to have_button(@amy.full_name)
      expect(page).to have_button(@rosa.full_name)
      expect(page).to_not have_button(@jake.full_name)
    end

    it 'displays home gym' do
      visit '/gym_members'

      expect(page).to have_content("Home Gym: #{@amy.climbing_gym.name}")
      expect(page).to have_content("Home Gym: #{@rosa.climbing_gym.name}")
    end

    it 'displays belay status' do
      visit '/gym_members'

      expect(page).to have_content("Belay Certified: #{@amy.belay_status}")
      expect(page).to have_content("Belay Certified: #{@rosa.belay_status}")
      expect(page).to_not have_content("Belay Certified: #{@jake.belay_status}")
    end

    it 'displays check-in count' do
      visit '/gym_members'

      expect(page).to have_content("Monthly Check-ins: #{@amy.monthly_checkins}")
      expect(page).to have_content("Monthly Check-ins: #{@rosa.monthly_checkins}")
      expect(page).to_not have_content("Monthly Check-ins: #{@jake.monthly_checkins}")
    end

    it 'has all gyms link' do
      visit '/gym_members'

      click_on 'Climbing Gyms'
      expect(current_path).to eq('/climbing_gyms')
    end

    it 'has update link for each member' do
      visit '/gym_members'
      expect(page).to_not have_content("Update Jake Peralta")

      click_on 'Update Amy Santiago'
      expect(current_path).to eq("/gym_members/#{@amy.id}/edit")

      visit '/gym_members'

      click_on 'Update Rosa Diaz'
      expect(current_path).to eq("/gym_members/#{@rosa.id}/edit")
    end

    it 'has delete button for each member' do
      visit "/gym_members"

      expect(page).to have_button("Delete Amy Santiago")
      expect(page).to_not have_button("Delete Jake Peralta")
      expect(page).to have_button("Delete Rosa Diaz")

      click_on "Delete Amy Santiago"
      expect(current_path).to eq("/gym_members")
      expect(page).to_not have_content("Amy Santiago")
      expect(page).to_not have_content("Jake Peralta")
      expect(page).to have_content("Rosa Diaz")
    end
  end
end
