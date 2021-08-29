require 'rails_helper'

RSpec.describe ClimbingGym, type: :model do
  before(:each) do
    @et = ClimbingGym.create!(name: "EarthTreks", ropes: true, total_routes: 200, updated_at: '2021-08-26 01:11:07 UTC', created_at: '2021-08-26 01:11:07 UTC')
    @movement = ClimbingGym.create!(name: "Movement RiNo", ropes: false, total_routes: 70, updated_at: '2021-08-27 01:11:07 UTC', created_at: '2021-08-27 01:11:07 UTC')
    @dbc = ClimbingGym.create!(name: "Denver Bouldering Club", ropes: false, total_routes: 85, updated_at: '2021-08-26 01:12:07 UTC', created_at: '2021-08-26 02:11:07 UTC')
  end
  it {should have_many :gym_members}

  describe 'class methods' do
    it 'orders by creation date' do
      gyms = ClimbingGym.order_by_creation
      expect(gyms).to eq([@movement, @dbc, @et])
    end
  end
end
