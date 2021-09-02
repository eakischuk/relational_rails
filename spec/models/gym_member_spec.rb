require 'rails_helper'

RSpec.describe GymMember, type: :model do
  before(:each) do
    @et = ClimbingGym.create!(name: "EarthTreks", ropes: true, total_routes: 200)
    @jake = GymMember.create!(climbing_gym: @et, first_name: "Jake", last_name: "Peralta", belay_status: false, monthly_checkins: 3)
    @amy = GymMember.create!(climbing_gym: @et, first_name: "Amy", last_name: "Santiago", belay_status: true, monthly_checkins: 12)
    @rosa = GymMember.create!(climbing_gym: @et, first_name: "Rosa", last_name: "Diaz", belay_status: true, monthly_checkins: 14)
  end

  it {should belong_to :climbing_gym}

  describe 'instance methods' do
    it 'has full name' do
      expect(@amy.full_name).to eq("Amy Santiago")
      expect(@jake.full_name).to eq("Jake Peralta")
    end
  end

  describe 'class methods' do
    it 'filters by number of checkins' do
      expect(GymMember.checkin_min(0)).to eq([@jake, @amy, @rosa])
      expect(GymMember.checkin_min(5)).to eq([@amy, @rosa])
      expect(GymMember.checkin_min(15)).to eq([])
    end
  end
end
