require 'rails_helper'

RSpec.describe ClimbingGym, type: :model do
  before(:each) do
    @et = ClimbingGym.create!(name: "EarthTreks", ropes: true, total_routes: 200, updated_at: '2021-08-26 01:11:07 UTC', created_at: '2021-08-26 01:11:07 UTC')
    @movement = ClimbingGym.create!(name: "Movement RiNo", ropes: false, total_routes: 70, updated_at: '2021-08-27 01:11:07 UTC', created_at: '2021-08-27 01:11:07 UTC')
    @dbc = ClimbingGym.create!(name: "Denver Bouldering Club", ropes: false, total_routes: 85, updated_at: '2021-08-26 01:12:07 UTC', created_at: '2021-08-26 02:11:07 UTC')
    @jake = GymMember.create!(climbing_gym: @et, first_name: "Jake", last_name: "Peralta", belay_status: false, monthly_checkins: 3)
    @amy = GymMember.create!(climbing_gym: @et, first_name: "Amy", last_name: "Santiago", belay_status: true, monthly_checkins: 12)
    @rosa = GymMember.create!(climbing_gym: @movement, first_name: "Rosa", last_name: "Diaz", belay_status: true, monthly_checkins: 14)
  end
  it {should have_many :gym_members}

  describe 'class methods' do
    it 'orders by creation date' do
      gyms = ClimbingGym.order_by_creation
      expect(gyms).to eq([@movement, @dbc, @et])
    end
  end

  describe 'instance methods' do
    it 'counts members' do
      expect(@et.member_count).to eq(2)
      expect(@movement.member_count).to eq(1)
      expect(@dbc.member_count).to eq(0)
    end

    it 'orders members by name' do
      expect(@et.sort_members('alphabet')).to eq([@amy, @jake])
      expect(@et.sort_members).to eq([@jake, @amy])
    end
  end
end
